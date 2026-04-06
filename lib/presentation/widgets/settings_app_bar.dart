import 'package:flutter/material.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      titleSpacing: 4,
      backgroundColor: AppColors.bgBase,
      surfaceTintColor: AppColors.bgBase,
      elevation: 5,
      title: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),

            Text(
              'Personalize sua experiência',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1), 
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: AppColors.border
          ),
        ),
      ),
    );
  }
}
