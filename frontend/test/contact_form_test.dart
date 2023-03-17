import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/contact_form.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/contact_submit.dart';

//flutter run -d chrome --web-port 2021 test/contact_form_test.dart
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.

  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Contact Form Tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;
    testWidgets('Contact form renders correct fields and submitButton',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: ContactForm(),
      )));

//Should have four fields and one submit button in total.
      final textFormFieldFinder = find.byType(TextFormField);
      final dropdownFieldFinder = find.byType(DropdownButtonFormField);
      final submitButtonFieldFinder = find.byType(ContactSubmit);

      expect(textFormFieldFinder, findsNWidgets(3));
      expect(dropdownFieldFinder, findsOneWidget);
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Contact form does not submit on empty input', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: ContactForm(),
      )));
      final submitButtonFieldFinder = find.byType(ContactSubmit);

      final contactName = find.byKey(const Key("ContactName"));
      final contactEmail = find.byKey(const Key("ContactEmail"));
      final contactMessage = find.byKey(const Key("ContactMessage"));

      expect(submitButtonFieldFinder, findsOneWidget);
      expect(contactName, findsOneWidget);
      expect(contactEmail, findsOneWidget);
      expect(contactMessage, findsOneWidget);

      await tester.tap(submitButtonFieldFinder);
      await tester.pumpAndSettle();

      final submitMessageOverlay = find.byType(AlertDialog);
      final acknowledgementButton = find.text("OK");

      expect(submitMessageOverlay, findsNothing);
      expect(acknowledgementButton, findsNothing);
      expect(find.text("Please enter a valid email."), findsOneWidget);
      expect(find.text("Please enter a valid message."), findsOneWidget);
      expect(find.text("Please enter a valid name."), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    //Add text input tests as well as validation checking (regexes)
  });
}
