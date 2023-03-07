import 'dart:ui';

import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/log_in/widgets/submit_button.dart';

const List<String> dropdownChoices = [
  'General',
  'Feedback',
  'Troubleshooting',
  'Complaints'
];

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String message = "";
  String contactType = dropdownChoices.first;
  int charCount = 0;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final emailRegex = RegExp(
      "[_a-zA-Z]+[_a-zA-Z0-9]?[\._]?[_a-zA-Z0-9]*@([a-zA-Z]+\.)?([a-zA-Z]+\.)?[a-zA-Z]+\.(com|net|de|uk|ro|jp)");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
                controller: nameController,
                onFieldSubmitted: (value) => print("name submitted"),
                onChanged: (value) => {},
                onSaved: (newValue) => name = newValue!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid name.";
                  }
                  return null;
                },
                decoration: customDecoration(
                    "Name", "Enter your name", Icons.person, false)),
            const SizedBox(height: 35),
            TextFormField(
                controller: emailController,
                onFieldSubmitted: (value) => print("email submitted"),
                onChanged: (value) => {},
                onSaved: (newValue) => email = newValue!,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !emailRegex.hasMatch(value)) {
                    return "Please enter a valid email.";
                  }
                  return null;
                },
                decoration: customDecoration(
                    "Email", "Enter your email", Icons.email_rounded, false)),
            const SizedBox(height: 35),
            DropdownButtonFormField(
              value: contactType,
              decoration: customDecoration(
                  "Feedback Type", "", Icons.question_mark, false),
              items: dropdownChoices.map<DropdownMenuItem>((choice) {
                return DropdownMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  contactType = value!;
                });
              },
              icon: const Icon(Icons.arrow_drop_down_circle_rounded),
            ),
            const SizedBox(height: 35),
            TextFormField(
              controller: messageController,
              onFieldSubmitted: (value) => print("message submitted"),
              onChanged: (value) => {
                setState((() => {message = value}))
              },
              onSaved: (newValue) => message = newValue!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid message.";
                }
                return null;
              },
              decoration:
                  customDecoration("Message", "", Icons.chat_bubble, true),
              keyboardType: TextInputType.multiline,
              maxLength: null,
              maxLines: null,
            ),
            const SizedBox(height: 40),
            SubmitButton(
                buttonText: "Send Feedback",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print("Valid form");

                    _formKey.currentState!.save();
                    try {
                      print('SUCCESS! email send');
                      setState(() {
                        charCount = 0;
                      });
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Message sent!'),
                          content: const Text(
                              'Thanks for using our app! We will aim to reply to you within 1-2 working days. :)'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => {
                                Navigator.pop(context, 'OK'),
                                nameController.clear(),
                                emailController.clear(),
                                messageController.clear(),
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } catch (error) {
                      print(error.toString());
                    }
                  } else {
                    print("Invalid form");
                  }
                }),
          ]),
        ),
      ),
    );
  }

  InputDecoration customDecoration(
      String labelText, String hintText, IconData iconIn, bool countChars) {
    return InputDecoration(
        counterText: countChars ? '${message.length.toString()} char(s)' : null,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white54),
        contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 25.0),
          child: Icon(iconIn,
              color: const Color(0xFFc8b8db)), // myIcon is a 48px-wide widget.
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white54),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFc8b8db)),
        ),
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: const TextStyle(color: Colors.white54),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}
