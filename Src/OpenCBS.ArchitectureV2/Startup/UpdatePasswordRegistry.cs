using OpenCBS.ArchitectureV2.Interface;
using StructureMap.Configuration.DSL;

namespace OpenCBS.ArchitectureV2.Startup
{
    public class AccrualInterestFuseRegistry : Registry
    {
        public AccrualInterestFuseRegistry()
        {
            For<IStartupProcess>().Use<CheckFuseboxProcess>();
            For<IStartupProcess>().Use<UpdatePasswordProcess>();
        }
    }
}

