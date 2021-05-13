import 'package:flutter/material.dart';
import 'package:marca_spb/modules/screen/HomePage.dart';
import 'package:marca_spb/modules/screen/generated_image/generated_image_page.dart';
import 'package:marca_spb/modules/screen/login/LoginPage.dart';
import 'package:marca_spb/modules/screen/questionary/questionary_page.dart';
import 'package:marca_spb/modules/screen/spb/spb_page.dart';
import 'package:marca_spb/modules/screen/user_profile/ProfilePage.dart';

import '../../modules/screen/user_profile/ProfilePage.dart';

Map<String, WidgetBuilder> routes = {
  '/home': (context) => HomePage(),
  '/profile': (context) => ProfilePage(),
  '/login': (context) => LoginPage(),
  '/questionary': (context) => QuestionaryPage(),
  '/spb': (context) => SpbPage(),
  '/generate': (context) => GeneratedImagePage(
        qualities: ModalRoute.of(context).settings.arguments,
      ),
};
