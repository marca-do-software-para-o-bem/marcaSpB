import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

class Square {
  Color cor;
  double x, y;
  Color colorSquare(valid) {
    if (valid == 0) {
      return Color.fromARGB(255, 0, 175, 228);
    } else if (valid == 1) {
      cor = UniqueColorGenerator.getColor();
      return cor;
    } else {
      return cor;
    }
  }

  double squareXPosition(valid) {
    if (valid == 0) {
      return 15.0;
    } else if (valid == 1) {
      x = random.nextInt(200).toDouble();
      return x;
    } else {
      return x;
    }
  }

  double squareYPosition(valid) {
    if (valid == 0) {
      return 0;
    } else if (valid == 1) {
      y = random.nextInt(40).toDouble();
      return y;
    } else {
      return y;
    }
  }
}

class SquareRounded {
  Color cor;
  double x, y;
  Color colorSquareRounded(valid) {
    if (valid == 0) {
      return Color.fromARGB(255, 233, 66, 130);
    } else if (valid == 1) {
      cor = UniqueColorGenerator.getColor();
      return cor;
    } else {
      return cor;
    }
  }

  double squareRoundedXPosition(valid) {
    if (valid == 0) {
      return 80.0;
    } else if (valid == 1) {
      x = random.nextInt(200).toDouble();
      return x;
    } else {
      return x;
    }
  }

  double squareRoundedYPosition(valid) {
    if (valid == 0) {
      return 0;
    } else if (valid == 1) {
      y = random.nextInt(40).toDouble();
      return y;
    } else {
      return y;
    }
  }
}

class Circle {
  Color cor;
  double x, y;
  Color colorCircle(valid) {
    if (valid == 0) {
      return Color.fromARGB(255, 149, 193, 31);
    } else if (valid == 1) {
      cor = UniqueColorGenerator.getColor();
      return cor;
    } else {
      return cor;
    }
  }

  double circleXPosition(valid) {
    if (valid == 0) {
      return 145.0;
    } else if (valid == 1) {
      x = random.nextInt(200).toDouble();
      return x;
    } else {
      return x;
    }
  }

  double circleYPosition(valid) {
    if (valid == 0) {
      return 0;
    } else if (valid == 1) {
      y = random.nextInt(40).toDouble();
      return y;
    } else {
      return y;
    }
  }
}

class UniqueColorGenerator {
  static Random random = new Random();

  static Color getColor() {
    List<Color> paleta = [
      Color.fromARGB(255, 78, 66, 79),
      Color.fromARGB(255, 139, 139, 137),
      Color.fromARGB(255, 196, 75, 53),
      Color.fromARGB(255, 225, 112, 44),
      Color.fromARGB(255, 237, 181, 12),
      Color.fromARGB(255, 100, 19, 17),
      Color.fromARGB(255, 164, 66, 115),
      Color.fromARGB(255, 233, 66, 130),
      Color.fromARGB(255, 54, 44, 65),
      Color.fromARGB(255, 98, 61, 96),
      Color.fromARGB(255, 4, 119, 161),
      Color.fromARGB(255, 37, 156, 194),
      Color.fromARGB(255, 0, 175, 228),
      Color.fromARGB(255, 38, 104, 52),
      Color.fromARGB(255, 149, 193, 31),
    ];
    return paleta[random.nextInt(paleta.length)];
  }
}
