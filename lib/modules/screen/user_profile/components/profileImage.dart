import 'package:flutter/material.dart';

Widget profileImage() {
  return Stack(fit: StackFit.loose, children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/as.png'),
                fit: BoxFit.cover,
              ),
            )),
      ],
    ),
    Padding(
        padding: EdgeInsets.only(top: 90.0, right: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            )
          ],
        )),
  ]);
}
