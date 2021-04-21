import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marca_spb/src/blocs/signup/signup_bloc.dart';
import 'package:marca_spb/src/data/user_repository/user_repository.dart';
import 'package:marca_spb/src/presentation/login/login_screen.dart';

import 'config/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'SpB',
        routes: routes,
        home: BlocProvider(
          create: (BuildContext context) => UserBloc(UserRepositoryImpl()),
          child: LoginPage(),
        ),
    );
  }
}
