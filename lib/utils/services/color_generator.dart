import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marca_spb/models/brand.dart';

class ColorGenerator {
  static Random random = new Random();

  static Color getSquareColor(Brand brand) {
    List<Color> paleta = [];
    if (brand.confianca) {
      paleta.add(Color.fromARGB(255, 196, 75, 53));
      paleta.add(Color.fromARGB(255, 225, 112, 44));
      paleta.add(Color.fromARGB(255, 237, 181, 12));
    }
    if (brand.cidadania) {
      paleta.add(Color.fromARGB(255, 4, 119, 161));
      paleta.add(Color.fromARGB(255, 37, 156, 194));
      paleta.add(Color.fromARGB(255, 0, 175, 228));
      paleta.add(Color.fromARGB(255, 38, 104, 52));
      paleta.add(Color.fromARGB(255, 149, 193, 31));
    }

    return paleta[random.nextInt(paleta.length)];
  }

  static Color getCircleColor(Brand qualities) {
    List<Color> paleta = [];
    if (qualities.dignidade) {
      paleta.add(Color.fromARGB(255, 78, 66, 79));
      paleta.add(Color.fromARGB(255, 139, 139, 137));
    }
    if (qualities.empoderamento) {
      paleta.add(Color.fromARGB(255, 164, 66, 115));
      paleta.add(Color.fromARGB(255, 233, 66, 130));
    }
    if (qualities.transformacao) {
      paleta.add(Color.fromARGB(255, 100, 19, 17));
      paleta.add(Color.fromARGB(255, 54, 44, 65));
      paleta.add(Color.fromARGB(255, 98, 61, 96));
    }

    return paleta[random.nextInt(paleta.length)];
  }

  static Color getSquareRoundedColor() {
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
