import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/modules/screen/generated_image/components/caputureFunction.dart';
import 'package:marca_spb/utils/services/color_generator.dart';
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'components/shapesClasses.dart';
import 'components/titles_and_buttons.dart';
import 'components/widget_to_image.dart';

class GeneratedImagePage extends StatefulWidget {
  Brand qualities;
  GeneratedImagePage({this.qualities});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<GeneratedImagePage> {
  int valid = 0;
  int validXPosition = 0;
  int validYPosition = 0;
  Square square = new Square();
  SquareRounded squareRounded = new SquareRounded();
  Circle circle = new Circle();
  Brand brand;

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
                            Stack(
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: 300,
                                  height: 80,
                                ),
                                Positioned(
                                  left: square.squareXPosition(validXPosition),
                                  bottom:
                                      square.squareYPosition(validYPosition),
                                  child: Icon(MdiIcons.square,
                                      size: 70,
                                      color: square.colorSquare(valid)),
                                ),
                                Positioned(
                                  left: squareRounded
                                      .squareRoundedXPosition(validXPosition),
                                  bottom: squareRounded
                                      .squareRoundedYPosition(validYPosition),
                                  child: Icon(MdiIcons.squareRounded,
                                      size: 70,
                                      color: squareRounded
                                          .colorSquareRounded(valid)),
                                ),
                                Positioned(
                                  left: circle.circleXPosition(validXPosition),
                                  bottom:
                                      circle.circleYPosition(validYPosition),
                                  child: Icon(MdiIcons.circle,
                                      size: 70,
                                      color: circle.colorCircle(valid)),
                                )
                              ],
                            )
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
            title("Color"),
            buttonRow1(_changeColor, _lockColor, _resetColor),
            Divider(color: Colors.white),
            title("Position"),
            Column(
              children: [
                subtitle(" X Axis"),
                buttonRow2(_changeXPosition, _lockXPostion, _resetXPosition)
              ],
            ),
            Column(
              children: [
                subtitle(" Y Axis"),
                buttonRow3(_changeYPosition, _lockYPostion, _resetYPosition)
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
