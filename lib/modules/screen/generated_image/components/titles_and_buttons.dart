import 'package:flutter/material.dart';

Widget title(String text) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

Widget subtitle(String text) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

Widget colorButton(String text, Function func, Color cor) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10), primary: cor, onPrimary: Colors.white),
    onPressed: func,
    child: Text(
      text,
      style: TextStyle(fontSize: 20),
    ),
  );
}

Widget saveImageButton(String text, Future<void> func, Color cor) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10), primary: cor, onPrimary: Colors.white),
      child: Text(
        'Caputure',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () async {
        func;
      });
}

Widget buttonRow1(Function random, Function lock, Function reset) {
  return Padding(
    padding: EdgeInsets.only(top: 5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      colorButton("Random!", random, Color.fromARGB(255, 0, 175, 228)),
      colorButton("Lock!", lock, Color.fromARGB(255, 233, 66, 130)),
      colorButton("Reset!", reset, Color.fromARGB(255, 149, 193, 31))
    ]),
  );
}

Widget buttonRow2(Function random, Function lock, Function reset) {
  return Padding(
    padding: EdgeInsets.only(top: 5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      colorButton("Random!", random, Color.fromARGB(255, 149, 193, 31)),
      colorButton("Lock!", lock, Color.fromARGB(255, 0, 175, 228)),
      colorButton("Reset!", reset, Color.fromARGB(255, 233, 66, 130))
    ]),
  );
}

Widget buttonRow3(Function random, Function lock, Function reset) {
  return Padding(
    padding: EdgeInsets.only(top: 5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      colorButton("Random!", random, Color.fromARGB(255, 233, 66, 130)),
      colorButton("Lock!", lock, Color.fromARGB(255, 149, 193, 31)),
      colorButton("Reset!", reset, Color.fromARGB(255, 0, 175, 228))
    ]),
  );
}

Widget buttonRow4(Function random, Function lock, Function reset) {
  return Padding(
    padding: EdgeInsets.only(top: 5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      colorButton("Random!", random, Color.fromARGB(255, 149, 193, 31)),
      colorButton("Lock!", lock, Color.fromARGB(255, 233, 66, 130)),
      colorButton("Reset!", reset, Color.fromARGB(255, 0, 175, 228))
    ]),
  );
}

Widget zAxisIconsButtons(Function squareInFront, Function squareRoundedInFront,
    Function circleInFront) {
  return Padding(
    padding: EdgeInsets.only(top: 5, right: 5),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          colorButton(
              "Square", squareInFront, Color.fromARGB(255, 0, 175, 228)),
          colorButton("Square Rounded", squareRoundedInFront,
              Color.fromARGB(255, 233, 66, 130)),
          colorButton(
              "Circle", circleInFront, Color.fromARGB(255, 149, 193, 31))
        ])
      ],
    ),
  );
}
