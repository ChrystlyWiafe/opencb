﻿using System.ComponentModel;

namespace OPENCBS.Fusebox
{
    public interface IAdvancedFuse:IFuse
    {
        /// <summary>
        /// Determines the name which describes the task
        /// </summary>
        string FuseName { get; }

        /// <summary>
        /// Determines the progress of the task
        /// </summary>
        ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}
