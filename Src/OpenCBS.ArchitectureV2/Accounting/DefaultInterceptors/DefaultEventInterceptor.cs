using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Data.SqlClient;
using OpenCBS.CoreDomain;
using OpenCBS.Extensions;
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
                _interceptorService.ReturnPrincipalAccount();
            }
            else
            {
                _bookingService.SaveBookings(_interceptorService.CreateBookings(), transaction);
            }
        }
    }
}
