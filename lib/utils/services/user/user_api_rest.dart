import 'dart:convert';

import 'package:http/http.dart';

import '../rest_api_service.dart';

// Lembrar de usar o Ngrok para usar https
const String urlBaseAuthority = '';

Future<dynamic> userList() async {
  final Response response =
      await client.get(Uri.https(urlBaseAuthority, 'usuario'));

  final decodedJson = jsonDecode(response.body);
  print(decodedJson);

  return decodedJson;
}
