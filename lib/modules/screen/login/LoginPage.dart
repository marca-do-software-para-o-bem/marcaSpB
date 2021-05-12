import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart';
import 'package:marca_spb/constants/api_path.dart';
import 'package:marca_spb/modules/screen/login/bloc/signup_bloc.dart';
import 'package:marca_spb/models/user.dart';
import 'package:marca_spb/utils/services/login/login_services.dart';
import 'package:marca_spb/utils/services/user/user_repository.dart';
import 'package:marca_spb/modules/screen/HomePage.dart';
import 'package:marca_spb/config/routes/routes.dart';
import 'package:marca_spb/utils/services/user/user_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserBloc userBloc = UserBloc(UserRepositoryImpl());
  LoginServices loginServices = LoginServices();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(LoadingSucessUserEvent());
  }

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async {
    final login =
        await loginServices.login(username: data.name, password: data.password);

    return Future.delayed(loginTime).then((_) {
      if (login != 'success') {
        return 'Login Failed';
      }
      return null;
    }).catchError(handleError);
  }

  handleError(e) {
    print('Error: ${e.toString()}');
  }

  Future<String> _signupUser(LoginData data) async {
    User user = User();
    user.email = data.name;
    user.password = data.password;
    BlocProvider.of<UserBloc>(context).add(CreateUserEvent(user));
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    /* gb */
  }

  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'SpB',
      //logo: 'assets/images/ecorp-lightgreen.png',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
