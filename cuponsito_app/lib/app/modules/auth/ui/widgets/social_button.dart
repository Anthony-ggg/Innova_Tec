import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final bool isDark;
  final String text;
  final String iconUrl;
  final VoidCallback onPressed;

  const SocialButton({
    required this.isDark,
    required this.text,
    required this.iconUrl,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        side: BorderSide(
          color: isDark ? Colors.white10 : AppColors.borderLight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: isDark
            ? AppColors.backgroundDark.withOpacity(0.3)
            : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            iconUrl,
            height: 24,
            width: 24,
            errorBuilder: (ctx, err, stack) =>
                const Icon(Icons.g_mobiledata, size: 24),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
