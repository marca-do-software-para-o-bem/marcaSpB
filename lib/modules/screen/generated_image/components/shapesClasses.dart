import 'package:flutter/material.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/utils/services/color_generator.dart';
import 'dart:math';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Random random = new Random();

class Square {
  Color cor, corInicial;
  double x, y;
  Color colorSquare(valid, qualities) {
    if (valid == 10) {
      corInicial = ColorGenerator.getSquareColor(qualities);
      cor = corInicial;
      return corInicial;
    } else if (valid == 1) {
      cor = ColorGenerator.getSquareColor(qualities);
      return cor;
    } else if (valid == 0) {
      return corInicial;
    } else {
      return cor;
    }
  }

  double squareXPosition(valid) {
    if (valid == 0) {
      return 15.0;
    } else if (valid == 1) {
      x = random.nextInt(150).toDouble();
      return x;
    } else {
      return x;
    }
  }

  double squareYPosition(valid) {
    if (valid == 0) {
      return 0;
    } else if (valid == 1) {
      y = random.nextInt(30).toDouble();
      return y;
    } else {
      return y;
    }
  }

  Widget generateSquare(
      int valid, int validXPosition, int validYPosition, Brand qualities) {
    return Positioned(
      left: this.squareXPosition(validXPosition),
      bottom: this.squareYPosition(validYPosition),
      child: Icon(MdiIcons.square,
          size: 60, color: this.colorSquare(valid, qualities)),
    );
  }
}

class SquareRounded {
  Color cor, corInicial;
  double x, y;
  Color colorSquareRounded(valid, qualities) {
    if (valid == 10) {
      corInicial = ColorGenerator.getSquareRoundedColor();
      cor = corInicial;
      return corInicial;
    } else if (valid == 1) {
      cor = ColorGenerator.getSquareRoundedColor();
      return cor;
    } else if (valid == 0) {
      cor = ColorGenerator.getSquareRoundedColor();
      return corInicial;
    } else {
      return cor;
    }
  }

  double squareRoundedXPosition(valid) {
    if (valid == 0) {
      return 70.0;
    } else if (valid == 1) {
      x = random.nextInt(200).toDouble();
      return x;
    } else if (valid == 1) {
      x = random.nextInt(150).toDouble();
      return x;
    } else {
      return x;
    }
  }

  double squareRoundedYPosition(valid) {
    if (valid == 0) {
      return 0;
    } else if (valid == 1) {
      y = random.nextInt(30).toDouble();
      return y;
    } else {
      return y;
    }
  }

  Widget generateSquareRounded(
      int valid, int validXPosition, int validYPosition, Brand qualities) {
    return Positioned(
      left: this.squareRoundedXPosition(validXPosition),
      bottom: this.squareRoundedYPosition(validYPosition),
      child: Icon(MdiIcons.squareRounded,
          size: 60, color: this.colorSquareRounded(valid, qualities)),
    );
  }
}

class Circle {
  Color cor, corInicial;
  double x, y;
  Color colorCircle(valid, qualities) {
    if (valid == 10) {
      corInicial = ColorGenerator.getCircleColor(qualities);
      cor = corInicial;
      return corInicial;
    } else if (valid == 0) {
      return corInicial;
    } else if (valid == 1) {
      cor = ColorGenerator.getCircleColor(qualities);
      return cor;
    } else {
      return cor;
    }
  }

  double circleXPosition(valid) {
    if (valid == 0) {
      return 125.0;
    } else if (valid == 1) {
      x = random.nextInt(150).toDouble();
      return x;
    } else {
      return x;
    }
  }

  double circleYPosition(valid) {
    if (valid == 0) {
      return 0;
    } else if (valid == 1) {
      y = random.nextInt(30).toDouble();
      return y;
    } else {
      return y;
    }
  }

  Widget generateCircle(
      int valid, int validXPosition, int validYPosition, Brand qualities) {
    return Positioned(
      left: this.circleXPosition(validXPosition),
      bottom: this.circleYPosition(validYPosition),
      child: Icon(MdiIcons.circle,
          size: 60, color: this.colorCircle(valid, qualities)),
    );
  }
}

// class UniqueColorGenerator {
//   static Random random = new Random();

//   static Color getColor() {
//     List<Color> paleta = [
//       Color.fromARGB(255, 78, 66, 79),
//       Color.fromARGB(255, 139, 139, 137),
//       Color.fromARGB(255, 196, 75, 53),
//       Color.fromARGB(255, 225, 112, 44),
//       Color.fromARGB(255, 237, 181, 12),
//       Color.fromARGB(255, 100, 19, 17),
//       Color.fromARGB(255, 164, 66, 115),
//       Color.fromARGB(255, 233, 66, 130),
//       Color.fromARGB(255, 54, 44, 65),
//       Color.fromARGB(255, 98, 61, 96),
//       Color.fromARGB(255, 4, 119, 161),
//       Color.fromARGB(255, 37, 156, 194),
//       Color.fromARGB(255, 0, 175, 228),
//       Color.fromARGB(255, 38, 104, 52),
//       Color.fromARGB(255, 149, 193, 31),
//     ];
//     return paleta[random.nextInt(paleta.length)];
//   }
// }
