﻿namespace OpenCBS.ArchitectureV2.Accounting.Interface.Presenter
{
    public interface IBookingsPresenterCallbacks
    {
        void OnCheck();
        void Add();
        void Edit();
        void OnDeleteBooking();
        void Refresh();
        void OnFiltering();
        void OnControlPrint();
        void DetachView();
    }
}
