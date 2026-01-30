import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final String placeholder;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const AuthInput({
    required this.label,
    required this.prefixIcon,
    required this.placeholder,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    super.key,
  });

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 6.0),
          child: Text(
            widget.label.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: isDark ? Colors.white70 : AppColors.textMuted,
            ),
          ),
        ),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.backgroundDark.withOpacity(0.5)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isFocused
                    ? AppColors.primary
                    : (isDark ? Colors.white10 : AppColors.borderLight),
                width: _isFocused ? 2 : 1,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Icon(
                  widget.prefixIcon,
                  color: _isFocused ? AppColors.primary : AppColors.textMuted,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: widget.isPassword && _obscureText,
                    keyboardType: widget.keyboardType,
                    style: TextStyle(
                      color: isDark ? Colors.white : AppColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      hintStyle: TextStyle(
                        color: AppColors.textMuted.withOpacity(0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      isDense: true,
                    ),
                  ),
                ),
                if (widget.isPassword)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textMuted,
                      size: 22,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
