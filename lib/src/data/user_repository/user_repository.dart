import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User> createUser(user);
}

const API_URL_BASE = 'https://jsonplaceholder.typicode.com';
const Map<String, String> API_HEADERS = {
  'Content-Type': 'application/json; charset=UTF-8'
};

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getAllUsers() async {
    try {
      final response = await http.get(Uri.https(API_URL_BASE, 'usuario'));
      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((u) => User.fromJson(u))
            .toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users ' + e);
    }
  }

  @override
  Future<User> createUser(user) async {
    try {
      if (user != null) {
        final response = await http.post(
          Uri.https(API_URL_BASE, 'usuario'),
          headers: API_HEADERS,
          body: jsonEncode({
            'userId': user.userId,
            'name': user.name,
            'email': user.email,
          }),
        );

        if (response.statusCode == 201) {
          return User.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to create a user');
        }
      }
    } catch (e) {
      throw Exception('Failed to create a user ' + e);
    }
  }
}
