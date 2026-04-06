import 'package:flutter/material.dart';
import 'package:liturgia_app/core/theme/app_text_styles.dart';

class TextEmpty extends StatelessWidget {
  final String text;

  const TextEmpty({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleMedium,
        ),
      ),
    );
  }
}