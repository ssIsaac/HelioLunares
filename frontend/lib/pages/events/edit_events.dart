import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_form.dart';

import '../../backend_communication/models/society_event.dart';

class EditSocietyEventsPage extends StatelessWidget {
  SocietyEvent obj = Get.find<SocietyEvent>();

  EditSocietyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 16.0),
        child: EventForm());
  }
}
