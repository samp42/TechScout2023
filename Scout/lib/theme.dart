import 'package:flutter/material.dart';

const whiteT4K = Color(0xffffffff);
const blackT4K = Color(0xff221e1f);
const yellowT4K = Color(0xfff6eb14);

const redPrimary = Color.fromRGBO(237, 27, 37, 1);
const redSecondary = Color.fromRGBO(131, 14, 18, 1);
const bluePrimary = Color.fromRGBO(1, 102, 179, 1);
const blueSecondary = Color.fromRGBO(1, 65, 114, 1);

final materialBlackT4K = MaterialColor(blackT4K.value, _makeSwatch(blackT4K));
final materialYellowT4K =
    MaterialColor(yellowT4K.value, _makeSwatch(yellowT4K));

Map<int, Color> _makeSwatch(Color color) {
  return <int, Color>{
    50: color,
    100: color,
    200: color,
    300: color,
    400: color,
    500: color,
    600: color,
    700: color,
    800: color,
    900: color,
  };
}
