using OpenCBS.Fusebox.DefaultAccrualFuse;
using OpenCBS.Fusebox.Interfaces;
using StructureMap.Configuration.DSL;

namespace OpenCBS.Fusebox.FuseboxRegistry
{
    public class FuseboxRegistry:Registry
    {
        public FuseboxRegistry()
        {
            For<IAdvancedFuse>().Use<AccrualFuse>();
        }
    }
}
