import 'package:flutter/material.dart';

Color kTextColor = const Color(0xFF727789);
Color kActiveColor = const Color(0xFF56cfdb);

Color backgroundColor = const Color(0xFFF0EEF3);
Color darkTextColor = const Color(0xFF5B6275);
Color lightTextColor = Colors.grey;
Color foregroundColor = const Color(0xFFF0EEF3);

var outerShadow = [
  BoxShadow(
    blurRadius: 12.0,
    offset: const Offset(-4, -4),
    color: Colors.white.withOpacity(0),
  ),
  BoxShadow(
    blurRadius: 12.0,
    offset: const Offset(4, 4),
    color: Colors.black.withOpacity(0.15),
  ),
];
