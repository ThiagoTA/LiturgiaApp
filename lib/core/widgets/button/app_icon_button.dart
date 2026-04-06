import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.bgGlass,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.border),
      ),
      child: IconButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        icon: icon,
        iconSize: 12,
        color: AppColors.textPrimary,
      ),
    );
  }
}