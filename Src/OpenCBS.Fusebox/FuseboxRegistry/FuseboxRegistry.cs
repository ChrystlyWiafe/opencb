using OpenCBS.Fusebox.DefaultAccrualFuse;
using OpenCBS.Fusebox.DefaultTransitFuse;
using OpenCBS.Fusebox.Interfaces;
using StructureMap.Configuration.DSL;

namespace OpenCBS.Fusebox.FuseboxRegistry
{
    public class FuseboxRegistry:Registry
    {
        public FuseboxRegistry()
        {
            For<IAdvancedFuse>().Use<DefaultAccrualPenaltyFuse>();
            For<IAdvancedFuse>().Use<DefaultAccualInterestFuse>();
            For<IAdvancedFuse>().Use<DefaultLateInterestTransitionFuse>();
            For<IAdvancedFuse>().Use<DefaultLatePrincipalTransitionFuse>();
        }
    }
}
