import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marca_spb/modules/screen/generated_image/components/caputureFunction.dart';
import 'package:marca_spb/modules/screen/generated_image/components/shapesClasses.dart';
import 'package:marca_spb/modules/screen/generated_image/components/titles_and_buttons.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../../../models/brand.dart';
import 'components/SpBIcons.dart';
import 'components/widget_to_image.dart';

class GeneratedImagePage extends StatefulWidget {
  final Brand qualities;

  GeneratedImagePage({this.qualities});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<GeneratedImagePage> {
  int valid = 0;
  int validXPosition = 0;
  int validYPosition = 0;
  int validZPosition = 0;
  int zIndex = 0;
  Square square = new Square();
  SquareRounded squareRounded = new SquareRounded();
  Circle circle = new Circle();
  SpBIcons spBIcons = new SpBIcons();

  void _changeColor() {
    valid = 1;
    setState(() {});
  }

  void _resetColor() {
    valid = 0;
    setState(() {});
  }

  void _lockColor() {
    valid = 3;
  }

  void _changeXPosition() {
    validXPosition = 1;
    setState(() {});
  }

  void _resetXPosition() {
    validXPosition = 0;
    setState(() {});
  }

  void _lockXPostion() {
    validXPosition = 3;
  }

  void _changeYPosition() {
    validYPosition = 1;
    setState(() {});
  }

  void _resetYPosition() {
    validYPosition = 0;
    setState(() {});
  }

  void _lockYPostion() {
    validYPosition = 3;
  }

  void _changeZPosition() {
    validZPosition = 1;
    setState(() {});
  }

  void _resetZPosition() {
    validZPosition = 0;
    setState(() {});
  }

  void _lockZPostion() {
    validZPosition = 3;
  }

  void _circleInFront() {
    validZPosition = 4;
    zIndex = 0;
    setState(() {});
  }

  void _squareroundedInFront() {
    validZPosition = 4;
    zIndex = 1;
    setState(() {});
  }

  void _squareInFront() {
    validZPosition = 4;
    zIndex = 2;
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
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            spBIcons.spbIconsRow(
                              valid,
                              validXPosition,
                              validYPosition,
                              zIndex,
                              validZPosition,
                              widget.qualities,
                            )
                          ])),
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Container(
                          width: 500,
                          height: 80,
                          child: Image.asset('assets/images/SpB.png'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(),
            title("Color"),
            buttonRow1(_changeColor, _lockColor, _resetColor),
            title("Position"),
            Divider(color: Colors.white),
            Column(
              children: [
                subtitle(" X Axis"),
                buttonRow2(_changeXPosition, _lockXPostion, _resetXPosition)
              ],
            ),
            Column(
              children: [
                subtitle(" Y Axis"),
                buttonRow3(_changeYPosition, _lockYPostion, _resetYPosition),
                subtitle("Z Axis"),
                buttonRow4(_changeZPosition, _lockZPostion, _resetZPosition),
                subtitle("Geometric shape in front"),
                zAxisIconsButtons(
                    _squareInFront, _squareroundedInFront, _circleInFront)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: elevatedButtonstyle,
                child: Text(
                  'Save Image',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () async {
                  captureImage(key1);
                },
              ),
            ),
            Divider(color: Colors.white),
            title("Generated Image"),
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
                  _saveScreenshot(bytes1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> captureImage(key1) async {
    final bytes1 = await Capture.capture(key1);
    setState(() {
      this.bytes1 = bytes1;
    });
  }

  Future<void> _saveScreenshot(pngBytes) async {
    try {
      //extract bytes

      //create file
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String fullPath = '$dir/${DateTime.now().millisecond}.png';
      File capturedFile = File(fullPath);
      await capturedFile.writeAsBytes(pngBytes);
      print(capturedFile.path);

      await GallerySaver.saveImage(capturedFile.path).then((value) {
        setState(() {});
      });
    } catch (e) {
      print(e);
    }
  }

  Widget buildImage(Uint8List bytes1) =>
      bytes1 != null ? Image.memory(bytes1) : Container();
}

final ButtonStyle elevatedButtonstyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(10), primary: Colors.pink, onPrimary: Colors.white);
