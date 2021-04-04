import 'dart:convert';
import 'models/user.dart';
import 'package:http/http.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User> createUser(user);
}

const API_URL_BASE = 'https://8f4e7a693ed8.ngrok.io';
//const API_URL_BASE = 'http://localhost:8000/';
const Map<String, String> API_HEADERS = {
  'Content-Type': 'application/json; charset=UTF-8'
};

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getAllUsers() async {
    try {
      var url = Uri.parse(API_URL_BASE + '/usuario/');
      final response = await get(url);
      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((u) => User.fromJson(u))
            .toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users ' + e.toString());
    }
  }

  @override
  Future<User> createUser(user) async {
    print('Criando um usuário');
    try {
      if (user != null) {
        var url = Uri.parse(API_URL_BASE + '/usuario/');
        final response = await post(
          url,
          headers: API_HEADERS,
          body: jsonEncode({
            'first_name': '00000',
            'username': '00000',
            'email': user.email,
            'account': {'cep': '00000', 'endereco': '00000', 'cnpj': '00000'},
            'password': user.password
          }),
        );

        if (response.statusCode == 201) {
          return User.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to create a user');
        }
      }
    } catch (e) {
      throw Exception('Failed to create a user ' + e.toString());
    }
  }
}
