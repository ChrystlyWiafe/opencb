using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Data.SqlClient;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.Extensions;
using OpenCBS.Services;
using OpenCBS.Services.Accounting;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    [Export(typeof(IEventInterceptor))]
    [ExportMetadata("Implementation", "Default")]
    [PartCreationPolicy(CreationPolicy.Shared)]
    public class DefaultEventInterceptor : IEventInterceptor
    {
        private EventInterceptorService _interceptorService;
        private readonly BookingService _bookingService;

        public DefaultEventInterceptor()
        {
            _bookingService = new BookingService(User.CurrentUser);
        }

        public void CallInterceptor(IDictionary<string, object> interceptorParams)
        {
            var transaction = interceptorParams.ContainsKey("SqlTransaction")
                ? (SqlTransaction)interceptorParams["SqlTransaction"]
                : null;
            if (transaction == null) return;

            if (interceptorParams.ContainsKey("Saving")) return;

            _interceptorService = new EventInterceptorService(interceptorParams);

            if (interceptorParams.ContainsKey("Deleted"))
            {
                _bookingService.AddCounterTransactionToEvent(interceptorParams, transaction);
            }
            else
            {
                _bookingService.SaveBookings(_interceptorService.CreateBookings(), transaction);

                var interceptorService2 = new DefaultPrincipalEventInterceptorService(interceptorParams);
                var transitionEvent = interceptorService2.GetPrincipalTransitEvent();

                if (transitionEvent != null)
                    ServicesProvider.GetInstance()
                        .GetEventProcessorServices()
                        .FireEvent(transitionEvent, new Loan { Id = transitionEvent.ContracId }, transaction);
            }
        }
    }
}
