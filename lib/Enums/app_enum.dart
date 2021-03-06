import 'dart:ui';

import 'package:flutter/material.dart';

class AppEnum {
  static const WHITE_POKEBALL_URL = 'assets/images/pokeball_white.png';
  static const BLACK_POKEBALL_URL = 'assets/images/pokeball_black.png';
  static double APP_BAR_HEIGTH = 120;

  static Color? getColorType({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
        break;
      case 'Fire':
        return Colors.red;
        break;
      case 'Water':
        return Colors.blue;
        break;
      case 'Grass':
        return Colors.green;
        break;
      case 'Electric':
        return Colors.amber;
        break;
      case 'Ice':
        return Colors.cyanAccent[400];
        break;
      case 'Fighting':
        return Colors.orange;
        break;
      case 'Poison':
        return Colors.purple;
        break;
      case 'Ground':
        return Colors.orange[300];
        break;
      case 'Psychic':
        return Colors.pink;
        break;
      case 'Flying':
        return Colors.indigo[200];
        break;
      case 'Ghost':
        return Colors.indigo[400];
        break;
      case 'Dark':
        return Colors.brown;
        break;
      case 'Steel':
        return Colors.blueGrey;
        break;
      case 'Fairy':
        return Colors.pinkAccent[100];
        break;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Dragon':
        return Colors.indigo[800];
      default:
        return Colors.grey;
        break;
    }
  }
}