﻿using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Accounting.CommandData;
using OpenCBS.ArchitectureV2.Accounting.Message;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.ArchitectureV2.Interface.Service;
using OpenCBS.Services.Accounting;

namespace OpenCBS.ArchitectureV2.Accounting.Command
{
    public class DeleteBookingCommand : ArchitectureV2.Command.Command, ICommand<DeleteBookingCommandData>
    {
        private readonly ITranslationService _translationService;
        private readonly BookingService _bookingService;
        private readonly IApplicationController _applicationController;

        public DeleteBookingCommand(
            ITranslationService translationService,
            BookingService bookingService, 
            IApplicationController applicationController)
            : base(applicationController)
        {
            _translationService = translationService;
            _bookingService = bookingService;
            _applicationController = applicationController;
        }

        public void Execute(DeleteBookingCommandData commandData)
        {
            var message = _translationService.Translate("Are you sure you want to permanently delete this booking?");
            var title = _translationService.Translate("Delete Booking");
            var result = MessageBox.Show(message, title, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result != DialogResult.Yes) return;
            _bookingService.DeleteBooking(commandData.Id);
            _applicationController.Publish(new BookingSavedMessage(this, null));
        }
    }
}
