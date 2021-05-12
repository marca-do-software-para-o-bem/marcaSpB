import 'dart:convert';

import 'package:http/http.dart';
import 'package:marca_spb/constants/api_path.dart';
import 'package:marca_spb/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../rest_api_service.dart';

// Lembrar de usar o Ngrok para usar https
// Lembrar de add no ALLOWED_USERS no BD
const String URL_BASE_AUTHORITY = '3ec90c8e2ce9.ngrok.io/';
const String URL_ENCODED_PATH = 'usuario';

const Map<String, String> API_USER_HEADERS = {
  'content-Type': 'application/json; charset=UTF-8'
};

class UserServices {
  final storage = new FlutterSecureStorage();
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
      String access = await storage.read(key: 'access');
      final Response response = await client
          .get(Uri.parse(API_URL_BASE + URL_ENCODED_PATH + '/$id'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $access',
      }).timeout(Duration(seconds: 10));

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
      return data;
    } catch (e) {
      throw Exception('Failed to create user $e');
    }
  }

  @override
  Future<User> updateUser(user, id) async {
    try {
      if (user != null) {
        String access = await storage.read(key: 'access');
        var url = Uri.parse(API_URL_BASE + 'usuario/$id');
        final response = await post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $access',
          },
          body: jsonEncode({
            'first_name': user.first_name,
            'username': user.email,
            'email': user.email,
            'account': {'cep': '00000', 'endereco': '00000', 'cnpj': '00000'},
            'password': user.password
          }),
        );

        if (response.statusCode == 200) {
          return User.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to update a user');
        }
      }
    } catch (e) {
      throw Exception('Failed to update a user ' + e.toString());
    }
  }

  //TODO
  //Fazer update

}
