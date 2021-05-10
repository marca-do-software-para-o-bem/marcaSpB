import 'dart:convert';

import 'package:http/http.dart';
import 'package:marca_spb/models/user.dart';

import '../rest_api_service.dart';

// Lembrar de usar o Ngrok para usar https
// Lembrar de add no ALLOWED_USERS no BD
const String URL_BASE_AUTHORITY = '9a81d5323ded.ngrok.io';
const String URL_ENCODED_PATH = 'usuario';

const Map<String, String> API_USER_HEADERS = {
  'content-Type': 'application/json; charset=UTF-8'
};

class UserServices {
  Future<List<User>> getAllUsers() async {
    try {
      final Response response = await client
          .get(Uri.https(URL_BASE_AUTHORITY, URL_ENCODED_PATH))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);

        List<User> users = decodedJson
            .map((dynamic userJson) => User.fromJson(userJson))
            .toList();

        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users $e');
    }
  }

  Future<User> getUser(int id) async {
    try {
      final Response response = await client
          .get(Uri.https(URL_BASE_AUTHORITY, '$URL_ENCODED_PATH/$id'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        return user;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users $e');
    }
  }

  Future<User> createUser(User user) async {
    final String userJson = jsonEncode(user.toJson());

    try {
      final Response response = await client.post(
        Uri.https(URL_BASE_AUTHORITY, URL_ENCODED_PATH),
        body: userJson,
      );
      var data = User.fromJson(jsonDecode(response.body));
      print(data);
      return data;
    } catch (e) {
      throw Exception('Failed to create user $e');
    }
  }

  //TODO
  //Fazer update

}
