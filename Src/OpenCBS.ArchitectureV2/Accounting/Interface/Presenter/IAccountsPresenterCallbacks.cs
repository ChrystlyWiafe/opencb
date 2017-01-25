﻿namespace OpenCBS.ArchitectureV2.Accounting.Interface.Presenter
{
    public interface IAccountsPresenterCallbacks
    {
        void Add();
        void Edit();
        void Delete();
        void Refresh();
        void DetachView();
    }
}
