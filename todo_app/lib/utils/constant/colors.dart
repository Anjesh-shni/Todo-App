import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const secondary = Color(0xffa6a6a6);
  static const iconGray = Color(0xff767676);
  static const black = Colors.black;
  static const primary = Color(0xff262626);
  static const primaryBg = Color(0xfff5f5fd);
  static const secondaryBg = Color(0xffececf6);
  static const barBg = Color.fromARGB(255, 78, 78, 78);

 static List<Color> backgroundColors = [
    const Color(0xFFCCE5FF), // light blue
    const Color(0xFFD7F9E9), // pale green
    const Color(0xFFFFF8E1), // pale yellow
    const Color(0xFFF5E6CC), // beige
    const Color(0xFFFFD6D6), // light pink
    const Color(0xFFE5E5E5), // light grey
    const Color(0xFFFFF0F0), // pale pink
    const Color(0xFFE6F9FF), // pale blue
    const Color(0xFFD4EDDA), // mint green
    const Color(0xFFFFF3CD), // pale orange
  ];
  static getRandomColor() {
    Random random = Random();
    return AppColors
        .backgroundColors[random.nextInt(AppColors.backgroundColors.length)];
  }
}
