import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/pages/edit_mode/widgets/members_table.dart';

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 40),
        Text("Admins"),
        MembersTable(),
        SizedBox(
          height: 20,
        ),
        Text("Local Admins"),
        MembersTable(),
        SizedBox(
          height: 20,
        ),
        Text("Members"),
        MembersTable(),
      ],
    );
  }
}
