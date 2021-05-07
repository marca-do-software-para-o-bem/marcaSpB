import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/utils/services/color_generator.dart';
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'components/widget_to_image.dart';

class GeneratedImagePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<GeneratedImagePage> {
  bool valid = false;
  Brand brand = Brand(
    cidadania: true,
    confianca: true,
    dignidade: false,
    empoderamento: true,
    transformacao: true,
  );

  Color _colorSquare() {
    if (valid == false) {
      return Color.fromARGB(255, 0, 175, 228);
    } else {
      return UniqueColorGenerator.getSquareColor(brand);
    }
  }

  Color _colorSquareRounded() {
    if (valid == false) {
      return Color.fromARGB(255, 233, 66, 130);
    } else {
      return UniqueColorGenerator.getSquareRoundedColor();
    }
  }

  Color _colorCircle() {
    if (valid == false) {
      return Color.fromARGB(255, 149, 193, 31);
    } else {
      return UniqueColorGenerator.getCircleColor(brand);
    }
  }

  Color _changeColor() {
    valid = true;
    setState(() {});
  }

  void _reset() {
    valid = false;
    setState(() {});
  }

  GlobalKey key1;
  Uint8List bytes1;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Teste",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetToImage(
              builder: (key) {
                this.key1 = key;
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.square,
                                    size: 75, color: _colorSquare()),
                                Icon(MdiIcons.squareRounded,
                                    size: 75, color: _colorSquareRounded()),
                                Icon(MdiIcons.circle,
                                    size: 75, color: _colorCircle())
                              ])),
                      Container(
                        width: 700,
                        height: 100,
                        child: Image.asset('assets/images/SpB.png'),
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: elevatedButtonstyle,
                      onPressed: _changeColor,
                      child: Text(
                        'Vai!',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ElevatedButton(
                      style: elevatedButtonstyle,
                      onPressed: _reset,
                      child: Text(
                        'Reset!',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: elevatedButtonstyle,
                child: Text(
                  'Caputure',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () async {
                  // final bytes1 = await Utils.capture(key1);
                  setState(() {
                    this.bytes1 = bytes1;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Image",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            buildImage(bytes1),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: elevatedButtonstyle,
                child: Text(
                  'Save on gallery',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () async {
                  print(bytes1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes1) =>
      bytes1 != null ? Image.memory(bytes1) : Container();
}

final ButtonStyle elevatedButtonstyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(10), primary: Colors.pink, onPrimary: Colors.white);
