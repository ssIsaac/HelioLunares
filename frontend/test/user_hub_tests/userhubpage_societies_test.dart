import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_societies.dart';
import 'dart:io';
void main(){
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => {HttpOverrides.global = null,});
  binding.window.physicalSizeTestValue = const Size(1920, 1080);
  testWidgets("UserHubPage_societies test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
        home: UserHubPage_societies()
      )
    );
    await tester.pumpAndSettle();

    final finder = find.byType(UserHubPage_societies);
    expect(finder, findsOneWidget);
  });
}