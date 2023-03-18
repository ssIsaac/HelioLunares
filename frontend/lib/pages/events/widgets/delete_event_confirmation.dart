import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/models/society_event.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/pages/events/events.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

class DeleteEventConfirmation extends StatelessWidget {
  final SocietyEvent event;

  const DeleteEventConfirmation({super.key, required this.event});

  showAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        //Delete the event
        //UNCOMMENT ONCE IMPLEMENTED :
        // data.dataCollector<SocietyEvent> collector =
        //     data.dataCollector<SocietyEvent>();
        // collector.deleteFromCollection(event);
        print(event.name);
        print("Event deleted");
        Navigator.of(context, rootNavigator: true).pop();

        navigationController.goBack();
        navigationController.goBack();
        // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        //     builder: (context) =>
        //         SiteLayout(childWidget: const SocietyEventsPage())));
      },
    );
    Widget cancelButton = ElevatedButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Event"),
      content: Text("Are you sure you want to delete this event?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    //return alert;
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
