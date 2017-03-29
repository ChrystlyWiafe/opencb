using OpenCBS.CoreDomain.Clients;
using OpenCBS.Enums;
using TinyMessenger;

namespace OpenCBS.ArchitectureV2.CommandData
{
    public class SearchClientNotification:ITinyMessage
    {
        public SearchClientNotification(object sender, IClient client, OSearchClientVariants searchClientVariant)
        {
            Sender = sender;
            Client = client;
            SearchClientVariant = searchClientVariant;
        }

        public IClient Client { get; set; }
        public object Sender { get; set; }
        public OSearchClientVariants SearchClientVariant { get; set; }
    }
}
