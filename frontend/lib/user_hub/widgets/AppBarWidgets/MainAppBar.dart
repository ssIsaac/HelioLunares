import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubThemes.dart';

import 'bought_tickets/user_bought_ticket_screen.dart';

class MainAppBar extends AppBar {
  MainAppBar(BuildContext context, {super.key})
      : super(
            title: const Text("TickEX"),
            backgroundColor: const Color(0xff70587C),
            iconTheme: MainAppBarTheme(),
            titleTextStyle: MainAppBarTextTheme(),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserBoughtTicketScreen()));
                  },
                  icon: const Icon(Icons.receipt)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserSettingsPage()));
                  },
                  icon: const Icon(Icons.settings))
            ]
            //
            );
}