import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ========= Base =========
  static const bgBase = Color(0xFF0D0E13);
  static const bgSurface = Color(0xFF13141C);
  static const bgCard = Color(0xFF191B26);
  static const bgRedCard = Color.fromARGB(129, 82, 12, 12);

  // ========= Glass / overlays =========
  static const bgGlass = Color.fromRGBO(255, 255, 255, 0.04);

  // ========= Text =========
  static const textPrimary = Color(0xFFEEE9DC);
  static const textSecondary = Color.fromRGBO(238, 233, 220, 0.55);
  static const textMuted = Color.fromRGBO(238, 233, 220, 0.30);
  static const textRed = Color.fromARGB(255, 245, 89, 89);

  // ========= Borders =========
  static const border = Color.fromRGBO(255, 255, 255, 0.08);

  // ========= Semantic / Liturgical =========
  static const purple = Color(0xFF9B6DC5);
  static const purpleBg = Color.fromRGBO(74, 38, 112, 0.20);

  static const green = Color(0xFF4CAF82);
  static const greenBg = Color.fromRGBO(46, 125, 90, 0.20);

  static const red = Color(0xFFE05252);
  static const redBg = Color.from(alpha: 0.22, red: 0.545, green: 0.125, blue: 0.125);

  static const pink = Color(0xFFE07FAA);
  static const pinkBg = Color.fromRGBO(139, 58, 90, 0.20);

  static const white = Color(0xFFC8C5D8);
  static const whiteBg = Color.fromRGBO(42, 45, 58, 0.40);
}