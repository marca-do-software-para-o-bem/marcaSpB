import 'dart:convert';

import 'package:http/http.dart';
import 'package:marca_spb/models/user.dart';

import '../rest_api_service.dart';

// Lembrar de usar o Ngrok para usar https
const String URL_BASE_AUTHORITY = '2441616a5a80.ngrok.io';
const String URL_ENCODED_PATH = 'usuario';

const Map<String, String> API_USER_HEADERS = {
  'Content-Type': 'application/json; charset=UTF-8'
};

class UserServices {
  Future<List<User>> getAllUsers() async {
    final Response response = await client
        .get(Uri.https(URL_BASE_AUTHORITY, URL_ENCODED_PATH))
        .timeout(Duration(seconds: 10));

    final List<dynamic> decodedJson = jsonDecode(response.body);
    List<User> users =
        decodedJson.map((dynamic userJson) => User.fromJson(userJson)).toList();

    print(users);
    return users;
  }

  //TODO
  //Terminar saveUser
  Future<List<User>> saveUser() async {
    final Response response = await client.post(
      Uri.https(URL_BASE_AUTHORITY, URL_ENCODED_PATH),
      headers: API_USER_HEADERS,
      body: {},
    );

    final List<dynamic> decodedJson = jsonDecode(response.body);
    List<User> users =
        decodedJson.map((dynamic userJson) => User.fromJson(userJson)).toList();

    return users;
  }
}
