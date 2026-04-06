import 'package:flutter/material.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/core/theme/app_text_styles.dart';
import 'package:liturgia_app/core/widgets/text/text_title_category.dart';
import 'package:liturgia_app/presentation/widgets/builder/settings_builder.dart';

class CardAntiphons extends StatelessWidget {
  final String title;
  final String text;

  const CardAntiphons({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return SettingsBuilder(
      builder: (context, settings) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitleCategory(text: title, noPadding: true),
                SizedBox(height: 8),
                Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.body.copyWith(
                    fontSize: settings.fontSize.toDouble()
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
