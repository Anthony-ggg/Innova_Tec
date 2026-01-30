import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final bool isDark;
  final VoidCallback? onTap;

  const CustomBackButton({
    required this.isDark,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.maybePop(context),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: isDark ? Colors.white : AppColors.textDark,
        ),
      ),
    );
  }
}
