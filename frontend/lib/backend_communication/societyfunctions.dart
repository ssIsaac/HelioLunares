import 'dart:io';

import 'models/all.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/globals.dart' as globals;

Future<http.Response> joinSociety(int societyId) async {
  print("beginning to join society");
  final response = await http.post(
    Uri.parse('${DATASOURCE}societyrole/join/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          "token ${globals.localdataobj.getToken()}"
    },
    body: jsonEncode({'society': societyId}),
  );

  if (response.statusCode == 201) {
    // Map<String, dynamic> data = json.decode(response.body);
    print("society joined");
  } else {
    print("society not joined");
  }
  print("ending join society");
  return response;
}

Future<http.Response> updateSociety(int userId, int roleLevel) async {
  print("beginning to update societyrole ");
  final response = await http.post(
    Uri.parse('${DATASOURCE}societyrole/update/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          "token ${globals.localdataobj.getToken()}"
    },
    body: jsonEncode({'user': userId, 'role_level': roleLevel}),
  );

  if (response.statusCode == 204) {
    print("society role updated");
  } else {
    print("society role not updated");
  }
  print("ending update society role");
  return response;
}
