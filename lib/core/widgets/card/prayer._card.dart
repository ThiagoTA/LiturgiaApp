import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liturgia_app/core/extensions/string_extensions.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/core/theme/app_text_styles.dart';
import 'package:liturgia_app/presentation/widgets/builder/settings_builder.dart';

class CardPrayer extends StatelessWidget {
  final String title;
  final String text;
  final String reference;
  final String type;
  final Color bgColor;
  final bool isExpanded;
  final VoidCallback onToggle;

  const CardPrayer({
    super.key,
    required this.title,
    required this.text,
    this.reference = '',
    this.type = '',
    this.bgColor = AppColors.bgCard,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsBuilder(
      builder: (context, settings) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (type.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      onTap: onToggle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (reference.trim().isNotEmpty)
                                  Text(
                                    '(${reference.toUpperCase()})',
                                    style: AppTextStyles.reference,
                                  ),
                                SizedBox(height: 4),
                                Text(title, style: AppTextStyles.subtitle),
                              ],
                            ),
                          ),
                          AnimatedRotation(
                            turns: settings.continuousReading
                                ? 0.5
                                : isExpanded
                                ? 0.5
                                : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: const FaIcon(
                              FontAwesomeIcons.angleDown,
                              size: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Column(
                        children: [
                          const Divider(),
                          const SizedBox(height: 4),
                          Text(
                            settings.biblicalReference ? text : text.removeBibleVerseNumbers(),
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.body.copyWith(
                              fontSize: settings.fontSize.toDouble(),
                            ),
                          ),
                        ],
                      ),
                      crossFadeState: !settings.continuousReading
                          ? isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
