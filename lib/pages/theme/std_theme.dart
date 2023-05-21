import 'package:flutter/material.dart';
import 'color_theme.dart';

class StdTheme implements ColorTheme {
  @override
  Color get background => const Color.fromARGB(255, 189, 205, 214);

  @override
  Color get error => Color(0xFFF424F);

  @override
  Color get floatingButton => Color.fromARGB(255, 234, 231, 223);

  @override
  Color get text => Colors.black;
}
