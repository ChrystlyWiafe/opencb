using System.Runtime.Serialization;

namespace OpenCBS.GUI.VersionCheck
{
    [DataContract]
    public class VersionInformation
    {
        [DataMember(Name = "version")]
        public string Version { get; set; }
        [DataMember(Name = "x86Url")]
        public string x86Link { get; set; }
        [DataMember(Name = "x64Url")]
        public string x64Link { get; set; }
    }
}
