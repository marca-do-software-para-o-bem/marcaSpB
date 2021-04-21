import 'package:flutter/material.dart';

Widget boxUserdata(String content, bool status) {
  return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: content,
                hintStyle: TextStyle(color: Colors.grey[900]),
              ),
              enabled: !status,
            ),
          ),
        ],
      ));
}
