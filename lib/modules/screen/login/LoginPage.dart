import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:marca_spb/modules/screen/login/bloc/signup_bloc.dart';
import 'package:marca_spb/models/user.dart';
import 'package:marca_spb/utils/services/user/user_repository.dart';
import 'package:marca_spb/modules/screen/HomePage.dart';
import 'package:marca_spb/config/routes/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserBloc userBloc = UserBloc(UserRepositoryImpl());

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(LoadingSucessUserEvent());
  }

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    final state = BlocProvider.of<UserBloc>(context).state;
    final user = List.from((state as LoadedSucessState).users)
        .firstWhere((u) => u.email == data.name);

    return Future.delayed(loginTime).then((_) {
      if (user == null) {
        return 'Email not exists';
      }
      /* else if (u[data.name] != data.password) {
          return 'Password does not match';
        } */

      return null;
    });
  }

  Future<String> _signupUser(LoginData data) {
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
