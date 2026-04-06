import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/button/app_icon_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String weekDay;
  final String date;
  final String description;

  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  final VoidCallback? onLeftHold;
  final VoidCallback? onRightHold;

  const HomeAppBar({
    super.key,
    required this.weekDay,
    required this.date,
    required this.description,
    this.onLeftPressed,
    this.onRightPressed,
    this.onLeftHold,
    this.onRightHold,
  });

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      elevation: 5,
      centerTitle: true,
      backgroundColor: AppColors.bgBase,
      surfaceTintColor: AppColors.bgBase,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: AppIconButton(
            icon: const FaIcon(FontAwesomeIcons.angleLeft),
            onPressed: onLeftPressed ?? () {},
            onLongPress: onLeftHold ?? () {},
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekDay.toUpperCase(),
            key: const ValueKey('weekDay'),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(height: 6),

          Text(
            date,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: 4),

          description.trim().isNotEmpty
              ? Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'CormorantGaramond',
                    color: AppColors.textSecondary,
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: 6),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: AppColors.textSecondary,
                        strokeWidth: 1.5,
                      ),
                    ),
                  ],
                ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Center(
            child: AppIconButton(
              icon: const FaIcon(FontAwesomeIcons.angleRight),
              onPressed: onRightPressed ?? () {},
              onLongPress: onRightHold ?? () {},
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 2),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.textSecondary.withValues(alpha: 0.0),
                  AppColors.textSecondary.withValues(alpha: 0.2),
                  AppColors.textSecondary.withValues(alpha: 0.6),
                  AppColors.textSecondary.withValues(alpha: 0.2),
                  AppColors.textSecondary.withValues(alpha: 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
