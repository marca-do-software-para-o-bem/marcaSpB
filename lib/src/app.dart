import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Software para o Bem',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: createContent(),
    );
  }

  createContent() {
    return Text("SpB");
  }
}
