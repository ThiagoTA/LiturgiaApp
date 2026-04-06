import 'package:flutter/material.dart';
import 'package:liturgia_app/core/theme/app_text_styles.dart';

class TextTitleCategory extends StatelessWidget {
  final String text;
  final bool noPadding;

  const TextTitleCategory({
    super.key,
    required this.text,
    this.noPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: noPadding ? EdgeInsets.zero : const EdgeInsetsGeometry.only(left: 16, right: 16, top: 16, bottom: 12),
      child: Text(text.toUpperCase(), style: AppTextStyles.titleMedium),
    );
  }
}
