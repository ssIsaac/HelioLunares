import 'package:flutter/material.dart';

class UserBoughtTicketScreen extends StatefulWidget {
  const UserBoughtTicketScreen({super.key});

  @override
  State<UserBoughtTicketScreen> createState() => _UserBoughtTicketScreenState();
}

class _UserBoughtTicketScreenState extends State<UserBoughtTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text ('A for apple')
          Text(appState.current.asLowerCase)
        ],)
    )
  }
} 