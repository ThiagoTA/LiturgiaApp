import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    height: 1.2,
    letterSpacing: 1.2
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static TextStyle body = TextStyle(
    fontSize: 18,
    fontFamily: 'CormorantGaramond',
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle reference = TextStyle(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
}
