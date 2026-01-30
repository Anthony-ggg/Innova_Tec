import 'package:cuponsito_app/app/modules/auth/ui/widgets/auth_input.dart';
import 'package:cuponsito_app/app/modules/auth/ui/widgets/custom_back_button.dart';
import 'package:cuponsito_app/app/modules/auth/ui/widgets/fade_in_up.dart';
import 'package:cuponsito_app/app/modules/auth/ui/widgets/social_button.dart';
import 'package:cuponsito_app/app/modules/common/ui/widgets/responsive_layout.dart';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDarker
          : AppColors.backgroundLight,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Soft Gradient Background
          const _SoftGradientBackground(),

          SafeArea(
            child: ResponsiveLayout(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header Nav
                    FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: Row(
                        children: [
                          CustomBackButton(isDark: isDark),
                          const Spacer(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Illustration Section
                    FadeInUp(
                      delay: 0.1,
                      child: Container(
                        height: 176,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            // Background Radial
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: RadialGradient(
                                    center: Alignment.center,
                                    radius: 0.8,
                                    colors: [
                                      AppColors.primary.withOpacity(0.15),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.storefront,
                                  size: 60,
                                  color: AppColors.primary.withOpacity(0.4),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.groups,
                                  size: 80,
                                  color: AppColors.primary.withOpacity(0.6),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.local_mall,
                                  size: 60,
                                  color: AppColors.primary.withOpacity(0.4),
                                ),
                              ],
                            ),
                            // Dots
                            Positioned(
                              bottom: 16,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Title
                    FadeInUp(
                      delay: 0.2,
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Únete a ',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: isDark
                                    ? Colors.white
                                    : AppColors.textDark,
                              ),
                              children: [
                                TextSpan(
                                  text: 'CUPONSITO',
                                  style: TextStyle(
                                    color: isDark
                                        ? AppColors.primary
                                        : AppColors.primaryDark,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Empieza a ahorrar en tu barrio hoy.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? AppColors.primary.withOpacity(0.7)
                                  : AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Inputs
                    FadeInUp(
                      delay: 0.3,
                      child: const AuthInput(
                        label: 'Nombre Completo',
                        prefixIcon: Icons.person_outline,
                        placeholder: 'Juan Pérez',
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInUp(
                      delay: 0.4,
                      child: const AuthInput(
                        label: 'Correo Electrónico',
                        prefixIcon: Icons.mail_outline,
                        placeholder: 'hola@ejemplo.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInUp(
                      delay: 0.5,
                      child: const AuthInput(
                        label: 'Contraseña',
                        prefixIcon: Icons.lock_outline,
                        placeholder: '••••••••',
                        isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInUp(
                      delay: 0.6,
                      child: const AuthInput(
                        label: 'Confirmar Contraseña',
                        prefixIcon: Icons.lock_reset,
                        placeholder: '••••••••',
                        isPassword: true,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Checkbox
                    FadeInUp(
                      delay: 0.7,
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _termsAccepted = !_termsAccepted),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                value: _termsAccepted,
                                activeColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                side: BorderSide(
                                  color: isDark
                                      ? Colors.white30
                                      : AppColors.borderLight,
                                ),
                                onChanged: (val) => setState(
                                  () => _termsAccepted = val ?? false,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: 'Acepto los ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isDark
                                        ? Colors.white
                                        : AppColors.textDark,
                                    height: 1.4,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'términos y condiciones',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? AppColors.primary
                                            : AppColors.primaryDark,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' y la política de privacidad.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Create Account Button (Gradient)
                    FadeInUp(
                      delay: 0.8,
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: AppColors.registerButtonGradient,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Crear Cuenta',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.backgroundDark,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Divider
                    FadeInUp(
                      delay: 0.9,
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: isDark
                                  ? Colors.white10
                                  : AppColors.borderLight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'O CONTINÚA CON',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMuted,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: isDark
                                  ? Colors.white10
                                  : AppColors.borderLight,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Googel Button
                    FadeInUp(
                      delay: 1.0,
                      child: SocialButton(
                        isDark: isDark,
                        text: 'Google',
                        iconUrl:
                            'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
                        onPressed: () {},
                      ),
                    ),

                    const SizedBox(height: 32),

                    FadeInUp(
                      delay: 1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Ya tienes una cuenta?',
                            style: TextStyle(
                              color: isDark
                                  ? Colors.grey[400]
                                  : AppColors.textMuted,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: Text(
                              'Inicia sesión',
                              style: TextStyle(
                                color: isDark
                                    ? AppColors.primary
                                    : AppColors.primaryDark,
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SoftGradientBackground extends StatelessWidget {
  const _SoftGradientBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SoftGradientPainter(),
    );
  }
}

class SoftGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Top Right radial
    paint.shader = RadialGradient(
      center: Alignment.topRight,
      radius: 1.0,
      colors: [
        AppColors.primary.withOpacity(0.08),
        Colors.transparent,
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Bottom Left radial
    paint.shader = RadialGradient(
      center: Alignment.bottomLeft,
      radius: 0.8,
      colors: [
        AppColors.primary.withOpacity(0.05),
        Colors.transparent,
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
