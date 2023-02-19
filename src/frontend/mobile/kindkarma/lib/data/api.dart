import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const serverURL= "kindkarma.adaptable.app";

bool testing = true;

String BASE_URL= testing ?"192.168.0.106:3000":serverURL;

login(String email, String password, String type) async {
  Map<String, dynamic> queryParams = {"email": email, "password": password};
  var response = await http.get(
    Uri.http(BASE_URL, "/auth/login/$type", queryParams),
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
    Uri.http(BASE_URL, "/auth/signup/$type"),
    body: queryParams,
  );

  print(response.body);
  return response;
}

Future<List<dynamic>> getAllEvents() async {
  var response = await http.get(Uri.http(BASE_URL, "/event/list"));
  debugPrint(response.body);

  var data = json.decode(response.body);

  return data['data'];
}

//!NOTE: Experimental Function
Future<List<dynamic>> deleteEvent(String id) async {
  var response =
      await http.delete(Uri.http(BASE_URL, "/event/remove"), body: {id: id});
  debugPrint(response.body);

  var data = json.decode(response.body);

  return data;
}

Future<dynamic> addEvent(Map event) async {
  var response = await http.post(
    Uri.http(BASE_URL, "/event/add"),
    body: (event),
  );

  debugPrint(response.body.toString());

  // var data = json.decode(response.body);

  // return data;
}
