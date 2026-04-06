import 'package:flutter/material.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItemData(
        label: 'Leituras',
        icon: FontAwesomeIcons.book,
        activeIcon: FontAwesomeIcons.bookOpen,
      ),
      _NavItemData(
        label: 'Orações',
        icon: FontAwesomeIcons.handsHolding,
        activeIcon: FontAwesomeIcons.handsPraying,
      ),
      _NavItemData(
        label: 'Antífonas',
        icon: FontAwesomeIcons.music,
        activeIcon: FontAwesomeIcons.music,
      ),
      _NavItemData(
        label: 'Extras',
        icon: FontAwesomeIcons.star,
        activeIcon: FontAwesomeIcons.solidStar,
      ),
      _NavItemData(
        label: 'Configurações',
        icon: FontAwesomeIcons.gear,
        activeIcon: FontAwesomeIcons.gears,
      ),
    ];

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.bgSurface.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = currentIndex == index;

            return Expanded(
              child: _BottomNavItem(
                label: item.label,
                icon: item.icon,
                actionicon: item.activeIcon,
                isSelected: isSelected,
                onTap: () => onTap(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String label;
  final FaIconData icon;
  final FaIconData actionicon;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.label,
    required this.icon,
    required this.actionicon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected
        ? AppColors.textPrimary
        : AppColors.textSecondary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.bgCard.withValues(alpha: 0.9)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: isSelected ? Border.all(color: AppColors.border) : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? actionicon : icon,
                  color: foregroundColor,
                  size: 16,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                    color: foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String label;
  final FaIconData icon;
  final FaIconData activeIcon;

  const _NavItemData({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
