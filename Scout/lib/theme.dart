import 'package:flutter/material.dart';

const blackT4K = Color(0xff221e1f);
const yellowT4K = Color(0xfff6eb14);

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
