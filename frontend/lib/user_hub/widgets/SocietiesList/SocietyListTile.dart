import 'package:flutter/material.dart';

// Should have:
// Image
// Name of event
// Date/Time of event
// Organiser

class SocietyListTile extends Material {
  SocietyListTile(
      BuildContext context, String societyName, String summary, String uni,
      {super.key})
      : super(
        color: Color(0x00000000),

        // Using Card avoids a lot of hassle with spacing
        child: Card(
          child: ListTile(
          title: Text(societyName),
          tileColor: Color(0xFFD2C2E5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: Icon(Icons.group),

          subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            mainAxisSize: MainAxisSize.max,
            children: [Flexible(child:Row(children: [Icon(Icons.info_outline),SizedBox(width: 5),Flexible(child:Text(summary, overflow: TextOverflow.ellipsis,maxLines: 2,))])),
              Flexible(child:Row(children: [Icon(Icons.school_outlined),SizedBox(width: 5),Flexible(child:Text(uni, overflow: TextOverflow.ellipsis,maxLines: 1,))])),
            ],
          ),
          
          // Add link to events page here
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text("Event here!"),
                        ),
                        body: const Center(
                            child: Text(
                                "Page showing event details here")),
                      )));
          },
        ),
        )
      );
            
}
