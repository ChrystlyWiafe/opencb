using System;
using System.Data;

namespace OPENCBS.Fusebox.Samples
{
    public class BadFuse : IFuse
    {
        public void Activate(IDbTransaction transaction)
        {
            throw new NotImplementedException();
        }

        public int Order
        {
            get { return 2; }
        }
    }
}
