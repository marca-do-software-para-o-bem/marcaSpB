import 'package:flutter/material.dart';
import 'package:marca_spb/src/presentation/login/login_screen.dart';
import 'package:marca_spb/src/presentation/menu/menu_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/menu': (BuildContext context) => HomePage(),
};