import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marca_spb/modules/screen/HomePage.dart';

import 'package:marca_spb/utils/services/user/user_repository.dart';

import 'config/routes/routes.dart';
import 'modules/screen/generated_image/generated_image_page.dart';
import 'modules/screen/login/bloc/signup_bloc.dart';
<<<<<<< HEAD
=======
import 'modules/screen/user_profile/ProfilePage.dart';
import 'modules/screen/user_profile/ProfilePage.dart';
import 'modules/screen/user_profile/SplashScreen.dart';
import 'package:marca_spb/modules/screen/login/LoginPage.dart';
import './modules/screen/testePost.dart';
>>>>>>> 054c172543de680efb19ca8fed935d233b9fc3b1

import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    title: 'Fluter Profile Page',
    routes: routes,
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primaryColor: Color(0xff0082CD), primaryColorDark: Color(0xff0082CD)),
    home: BlocProvider(
      create: (BuildContext context) => UserBloc(UserRepositoryImpl()),
      child: LoginPage(),
    ),
    // routes: <String, WidgetBuilder>{
    //   //SPLASH_SCREEN: (BuildContext context) => new MapScreen(),
    //   PROFILE: (BuildContext context) => new ProfilePage(),
    // },
  ));
}
