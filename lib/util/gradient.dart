import 'package:flutter/material.dart';

class MyGradient {
  static LinearGradient topToBottom(Color start, Color end) {
    return LinearGradient(
      colors: [start, end],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static LinearGradient leftToRight(Color start, Color end) {
    return LinearGradient(
      colors: [start, end],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}
