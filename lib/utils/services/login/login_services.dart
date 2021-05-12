import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:marca_spb/constants/api_path.dart';
import 'package:marca_spb/models/login.dart';
import 'package:marca_spb/utils/services/rest_api_service.dart';

class LoginServices {
  Future<String> login({username: String, password: String}) async {
    final storage = new FlutterSecureStorage();
    try {
      final Response response = await client.post(
        Uri.parse(API_URL_BASE + 'api/token/'),
        headers: API_HEADERS,
        body: jsonEncode({'username': username, 'password': password}),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        storage.write(key: 'refresh', value: data[0]);
        storage.write(key: 'access', value: data[1]);
        return 'success';
      } else {
        return 'failed';
      }
    } catch (e) {
      throw Exception('Failed to sign in $e');
    }
  }
}
