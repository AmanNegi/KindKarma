import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "kindkarma.adaptable.app";

login(String email, String password, String type) async {
  Map<String, dynamic> queryParams = {"email": email, "password": password};
  var response = await http.get(
    Uri.https(BASE_URL, "/auth/login/$type", queryParams),
  );

  print(response.body);
  return response;
}

signUp(String email, String password, String userName, String type) async {
  Map<String, dynamic> queryParams = {
    "email": email,
    "username": userName,
    "password": password
  };

  var response = await http.post(
    Uri.https(BASE_URL, "/auth/signup/$type"),
    body: queryParams,
  );

  print(response.body);
  return response;
}

Future<List<dynamic>> getAllEvents() async {
  var response = await http.get(Uri.https(BASE_URL, "/event/list"));
  debugPrint(response.body);

  var data = json.decode(response.body);

  return data['data'];
}
