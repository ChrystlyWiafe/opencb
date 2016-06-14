using System;

namespace OpenCBS.Fusebox.Fusebox
{
    /// <summary>
    /// Specifies a Fusebox log entry.
    /// </summary>
    public class FuseBoxLogEntry
    {
        /// <summary>
        /// Fuse name (task) that authored the entry.
        /// </summary>
        public string FuseName { get; set; }

        /// <summary>
        /// Timestamp when the task was activated.
        /// </summary>
        public DateTime StartedAt { get; set; }

        /// <summary>
        /// Timestamp when the task stopped.
        /// </summary>
        public DateTime EndedAt { get; set; }

        /// <summary>
        /// Error message.
        /// </summary>
        public string ErrorMessage { get; set; }

        /// <summary>
        /// Stack trace of the exception.
        /// </summary>
        public string StackTrace { get; set; }
    }
}
