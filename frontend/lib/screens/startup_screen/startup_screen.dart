import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/about.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/contact.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/hero.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/howtouse.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/testimonials.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_footer.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  int index = 0;
  static const List<Widget> _subpages = <Widget>[
    StartupHero(),
    AboutSection(),
    HowToUseSection(),
    TestimonialsSection(),
    ContactSection()
  ];

  changeSubpage(i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 245, 1),
      appBar: StartupNavbar(
        callback: ((i) => changeSubpage(i)),
        selectedIndex: index,
      ),
      body: SafeArea(
          child: Center(
              child: Column(children: [
        //This is where to change the widgets/'pages'
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _subpages.elementAt(index),
        ),
      ]))),
      bottomNavigationBar: const Footer(),
    );
  }
}
