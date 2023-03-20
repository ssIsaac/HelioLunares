import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/widgets/layout.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart' as data;

/*
This widget is a button that links to the Society Hub (Sita).
It checks if the user has the relevant permissions:
PeopleRoleAtSociety = 2, or 
PeopleRoleAtSociety = 3

otherwise hide this widget
*/

class SocietyHubLink extends StatelessWidget {
  SocietyHubLink({super.key,this.Orderby = data.OrderType.CHRONOLOGICAL,
      this.filter = const {},
      this.id = -1});

  data.OrderType Orderby;
  Map<String, String> filter;
  int id;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.User>(
                  filter: filter, order: Orderby))],
      builder: (context, child){
        var isVisible = true;
        return Visibility(child:IconButton(
            icon: Icon(Icons.swap_horiz_outlined),
            tooltip: "Swap to Society Hub",
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(
                        builder: (context) => SiteLayout())
              );
            },
          ),
        visible: isVisible,
        );
      },
    );

  }
}