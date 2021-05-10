import 'package:flutter/material.dart';
import 'package:marca_spb/models/account.dart';
import 'package:marca_spb/models/user.dart';
import 'package:marca_spb/utils/services/user/user_services.dart';

class TestePost extends StatefulWidget {
  @override
  _TestePostState createState() => _TestePostState();
}

class _TestePostState extends State<TestePost> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();

  Account conta =
      new Account(cep: "222222", cnpj: "812336", endereco: "Rua 77");
  User joao = User(
      firstName: "joao",
      username: "usuario",
      email: "joao@joao.com",
      password: "coxinha 123",
      account: null);
  UserServices services = UserServices();

  @override
  Widget build(BuildContext context) {
    joao.account = conta;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(23),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
            ),
            TextField(
              controller: firstNameController,
            ),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            TextField(
              controller: cepController,
            ),
            TextField(
              controller: enderecoController,
            ),
            TextField(
              controller: cnpjController,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  services.createUser(joao);
                  print(joao);
                },
                child: Text(
                  'Vai!',
                  style: TextStyle(fontSize: 45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
