import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String text;
  final Color textColor;
  final String? version;
  final FaIconData? icon;
  final Color? bg;
  final bool isSwitch;
  final bool check;
  final ValueChanged<bool>? onCheck;
  final bool isStepper;
  final int value;
  final bool isTimePicker;
  final String timeText;
  final VoidCallback? onTap;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;
  final Widget? child;

  const SettingsCard({
    super.key,
    required this.title,
    required this.text,
    this.icon,
    this.bg = AppColors.bgCard,
    this.version,
    this.textColor = AppColors.textPrimary,
    this.isSwitch = false,
    this.check = false,
    this.onCheck,
    this.isStepper = false,
    this.value = 0,
    this.isTimePicker = false,
    this.timeText = '00:00',
    this.onTap,
    this.onDecrease,
    this.onIncrease,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        radius: 70,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          text,
                          style: TextStyle(
                            color: textColor.withValues(alpha: 0.55),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  if (isStepper) ...[
                    const SizedBox(width: 12),
                    StepperCard(
                      value: value,
                      onDecrease: onDecrease,
                      onIncrease: onIncrease,
                    ),
                  ],

                  if (isSwitch) ...[
                    const SizedBox(width: 12),
                    SwitchCard(check: check, onCheck: onCheck),
                  ],

                  if (isTimePicker) ...[
                    const SizedBox(width: 12),
                    TimerCard(timeText: timeText, onTap: onTap ?? () {}),
                  ],

                  if (icon != null) ...[
                    const SizedBox(width: 16),
                    FaIcon(icon, size: 16, color: AppColors.textPrimary),
                  ],

                  if (version != null) ...[
                    const SizedBox(width: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsGeometry.symmetric(
                          horizontal: 12,
                          vertical: 8
                        ),
                        child: Text(
                          version!,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (child != null) ...[SizedBox(height: 12), ?child],
            ],
          ),
        ),
      ),
    );
  }
}

class TimerCard extends StatelessWidget {
  final String timeText;
  final VoidCallback onTap;

  const TimerCard({super.key, required this.timeText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Center(
            child: Text(
              timeText,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchCard extends StatelessWidget {
  final bool check;
  final ValueChanged<bool>? onCheck;

  const SwitchCard({super.key, required this.check, this.onCheck});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Switch(
          value: check,
          onChanged: onCheck,
          activeThumbColor: AppColors.purple,
          inactiveThumbColor: AppColors.textMuted,
          inactiveTrackColor: AppColors.bgSurface,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}

class StepperCard extends StatelessWidget {
  final int value;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;

  const StepperCard({
    super.key,
    required this.value,
    this.onDecrease,
    this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StepperButton(label: '−', onTap: onDecrease),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.border,
            ),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
              child: Text(
                value.toString(),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.border,
            ),
            _StepperButton(label: '+', onTap: onIncrease),
          ],
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _StepperButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: SizedBox(
          width: 38,
          height: 38,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
