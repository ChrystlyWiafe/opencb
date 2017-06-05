using System.Data;

namespace OPENCBS.Fusebox
{
    /// <summary>
    /// Defines a task that will be launched.
    /// </summary>
    public interface IFuse
    {
        /// <summary>
        /// Launches the task.
        /// </summary>
        /// <param name="transaction">The database transaction.</param>
        void Activate(IDbTransaction transaction);

        /// <summary>
        /// Determines the order of the task.
        /// </summary>
        int Order { get; }
    }
}
