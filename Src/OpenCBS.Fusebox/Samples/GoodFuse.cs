using System;
using System.Data;

namespace OPENCBS.Fusebox.Samples
{
    public class GoodFuse : IFuse
    {
        public void Activate(IDbTransaction transaction)
        {
            Console.WriteLine("Hello, GoodFuse is activated.");
        }

        public int Order
        {
            get { return 1; }
        }
    }
}
