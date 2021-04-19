import 'constants/constants_screen.dart';
import 'modules/screen/user_profile/ProfilePage.dart';
import 'modules/screen/user_profile/SplashScreen.dart';

import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    title: 'Fluter Profile Page',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primaryColor: Color(0xff0082CD), primaryColorDark: Color(0xff0082CD)),
    home: new ProfilePage(),
    routes: <String, WidgetBuilder>{
      //SPLASH_SCREEN: (BuildContext context) => new MapScreen(),
      PROFILE: (BuildContext context) => new ProfilePage(),
    },
  ));
}
