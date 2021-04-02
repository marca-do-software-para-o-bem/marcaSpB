import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:marca_spb/src/blocs/signup/signup_bloc.dart';
import 'package:marca_spb/src/data/user_repository/models/user.dart';
import 'package:marca_spb/src/data/user_repository/user_repository.dart';
import '../../app.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  UserRepository userRpl;
  UserBloc userBloc = UserBloc(UserRepositoryImpl());
  // ignore: non_constant_identifier_names
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Email not exists';
      } else if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _signupUser(LoginData data) {
    User user = User();
    user.email = data.name;
    user.password = data.password;
    userBloc.add(CreateUserEvent(user));
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  Widget build(BuildContext context) {
    userBloc.add(LoadingSucessUserEvent());
    return FlutterLogin(
      title: 'ECORP',
      logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => App(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
