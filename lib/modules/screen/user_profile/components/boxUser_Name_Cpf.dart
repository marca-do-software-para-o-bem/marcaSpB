import 'package:flutter/material.dart';

Widget BoxUserNameCPF(String name, String cpf, bool status) {
  return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: name,
                  hintStyle: TextStyle(color: Colors.grey[900]),
                ),
                enabled: !status,
              ),
            ),
            flex: 2,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: cpf,
                hintStyle: TextStyle(color: Colors.grey[900]),
              ),
              enabled: !status,
            ),
            flex: 2,
          ),
        ],
      ));
}
