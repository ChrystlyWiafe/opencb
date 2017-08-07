using OpenCBS.ArchitectureV2.CommandData;
using OpenCBS.ArchitectureV2.Interface;

namespace OpenCBS.ArchitectureV2.Command
{
    public class ShowWriteOffViewCommand : ICommand<ShowWriteOffViewCommandData>
    {
        public void Execute(ShowWriteOffViewCommandData commandData)
        {
            commandData.DefaultAction();
        }
    }
}
