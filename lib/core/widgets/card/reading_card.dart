import 'package:flutter/material.dart';
import 'package:liturgia_app/core/extensions/string_extensions.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/core/theme/app_text_styles.dart';
import 'package:liturgia_app/presentation/widgets/builder/settings_builder.dart';

class CardReading extends StatelessWidget {
  final Color bg;
  final bool isPsalm;
  final String reference;
  final Color referenceColor;
  final String title;
  final Color titleColor;
  final String text;

  const CardReading({
    super.key,
    required this.bg,
    this.isPsalm = false,
    required this.reference,
    required this.referenceColor,
    required this.title,
    this.titleColor = AppColors.textPrimary,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsBuilder(
      builder: (context, settings) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reference.toUpperCase().replaceAll(RegExp(r'\(.*?\)'), ''),
                  style: AppTextStyles.reference
                ),
                if (isPsalm)
                  Column(
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'Refrão'.toUpperCase(),
                        style: TextStyle(
                          fontSize: settings.fontSize.toDouble() - 6,
                          fontWeight: FontWeight.w500,
                          color: referenceColor.withValues(alpha: 0.5),
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CormorantGaramond',
                    fontSize: settings.fontSize.toDouble() + 2,
                    height: 1.3,
                  ),
                ),
                Divider(),
                Text(
                  settings.biblicalReference ? text : text.removeBibleVerseNumbers(),
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.body.copyWith(
                    fontSize: settings.fontSize.toDouble(),
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
