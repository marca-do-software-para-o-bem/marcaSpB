import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

Widget zButton(Widget icon, Function func, Color cor) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10), primary: cor, onPrimary: Colors.white),
    onPressed: func,
    child: icon,
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
      colorButton("Random!", random, Color.fromARGB(255, 255, 20, 147)),
      colorButton("Lock!", lock, Color.fromARGB(255, 255, 105, 180)),
      colorButton("Reset!", reset, Colors.pink[200])
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
          zButton(
              Icon(
                MdiIcons.square,
                size: 30,
              ),
              squareInFront,
              Color.fromARGB(255, 255, 20, 147)),
          zButton(
              Icon(
                MdiIcons.squareRounded,
                size: 30,
              ),
              squareRoundedInFront,
              Colors.pink),
          zButton(
              Icon(
                MdiIcons.circle,
                size: 30,
              ),
              circleInFront,
              Color.fromARGB(255, 255, 105, 180))
        ])
      ],
    ),
  );
}
