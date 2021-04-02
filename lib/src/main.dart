import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marca_spb/src/blocs/signup/signup_bloc.dart';
import 'package:marca_spb/src/data/user_repository/user_repository.dart';
import 'package:marca_spb/src/presentation/login/login_screen.dart';

void main() => runApp(MaterialApp(
    title: 'SpB',
    home: BlocProvider(
      create: (BuildContext context) => UserBloc(UserRepositoryImpl()),
      child: LoginScreen(),
    )));
