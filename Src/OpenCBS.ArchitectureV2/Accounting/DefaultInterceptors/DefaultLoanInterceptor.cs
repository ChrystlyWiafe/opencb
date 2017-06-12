using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Data.SqlClient;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.Extensions;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    [Export(typeof(ILoanInterceptor))]
    [ExportMetadata("Implementation", "Accounting")]
    [PartCreationPolicy(CreationPolicy.Shared)]
    public class LoanInterceptor : ILoanInterceptor
    {
        public void Save(IDictionary<string, object> interceptorParams)
        {
            var loan = interceptorParams.ContainsKey("Loan") ? (Loan)interceptorParams["Loan"] : new Loan();
            if (loan.Id == 0) return;

            var transaction = interceptorParams.ContainsKey("SqlTransaction")
                                  ? (SqlTransaction)interceptorParams["SqlTransaction"]
                                  : null;
            if (transaction == null) return;
            var service = new LoanInterceptorService();
            service.SetAccountsToCredit(loan, transaction);
        }

        public void Update(IDictionary<string, object> interceptorParams)
        {
        }
    }
}
