import 'dart:ui';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonNavigatorBar extends StatelessWidget {
  final List<IconData> iconsList;
  final ValueChanged<int> onTap;
  final int initialIndex;

  const ButtonNavigatorBar({
    super.key,
    required this.iconsList,
    required this.onTap,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.backgroundDark.withOpacity(0.8)
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: isDark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.white.withOpacity(0.6),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF13EC5B).withOpacity(0.05)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(iconsList.length, (index) {
                final isSelected = index == initialIndex;
                return _NavBarItem(
                  icon: iconsList[index],
                  isSelected: isSelected,
                  onTap: () => onTap(index),
                  isDark: isDark,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _NavBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutSine,
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? AppColors.backgroundDark
              : (isDark ? Colors.grey[400] : Colors.grey[500]),
          size: 26,
        ),
      ),
    );
  }
}
