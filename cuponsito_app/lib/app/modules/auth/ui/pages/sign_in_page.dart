import 'package:cuponsito_app/app/modules/auth/ui/widgets/auth_input.dart';
import 'package:cuponsito_app/app/modules/auth/ui/widgets/custom_back_button.dart';
import 'package:cuponsito_app/app/modules/auth/ui/widgets/fade_in_up.dart';
import 'package:cuponsito_app/app/modules/auth/ui/widgets/social_button.dart';
import 'package:cuponsito_app/app/modules/common/ui/widgets/responsive_layout.dart';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDarkAlt
          : AppColors.backgroundLight,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Gradient Mesh
          const _BackgroundMesh(),

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
                    // Navbar
                    FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBackButton(isDark: isDark),
                          Text(
                            'CUPONSITO',
                            style: TextStyle(
                              color: isDark ? Colors.white : AppColors.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Icon/Logo Section
                    const FadeInUp(
                      delay: 0.1,
                      child: Center(child: _LogoCard()),
                    ),
                    const SizedBox(height: 24),

                    // Welcome Text
                    FadeInUp(
                      delay: 0.2,
                      child: Column(
                        children: [
                          Text(
                            '¡Hola de nuevo!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: isDark ? Colors.white : AppColors.textDark,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ahorros inteligentes a la vuelta de la esquina.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? Colors.grey[400]
                                  : AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Form
                    FadeInUp(
                      delay: 0.3,
                      child: const AuthInput(
                        label: 'Email',
                        prefixIcon: Icons.mail_outline,
                        placeholder: 'tu@email.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      delay: 0.4,
                      child: const AuthInput(
                        label: 'Contraseña',
                        prefixIcon: Icons.lock_outline,
                        placeholder: '••••••••',
                        isPassword: true,
                      ),
                    ),

                    // Forgot Password
                    FadeInUp(
                      delay: 0.5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? AppColors.primary
                                  : AppColors.primaryDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Sign In Button
                    FadeInUp(
                      delay: 0.6,
                      child: _SignInButton(isDark: isDark),
                    ),

                    const SizedBox(height: 24),

                    // Divider
                    FadeInUp(
                      delay: 0.7,
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

                    // Google Button
                    FadeInUp(
                      delay: 0.8,
                      child: SocialButton(
                        isDark: isDark,
                        text: 'Google',
                        iconUrl:
                            'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
                        onPressed: () {},
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Footer
                    FadeInUp(
                      delay: 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿No tienes cuenta?',
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
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Únete ahora',
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

class _LogoCard extends StatefulWidget {
  const _LogoCard();

  @override
  State<_LogoCard> createState() => _LogoCardState();
}

class _LogoCardState extends State<_LogoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 4 * _controller.value), // Subtle float
          child: child,
        );
      },
      child: SizedBox(
        width: 112,
        height: 112,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background rotated
            Transform.rotate(
              angle: 0.1, // ~6 degrees
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            // Main Card
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.shopping_bag,
                    size: 56,
                    color: AppColors.backgroundDark,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final bool isDark;
  const _SignInButton({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.backgroundDark,
        minimumSize: const Size(double.infinity, 56),
        elevation: 8,
        shadowColor: AppColors.primary.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_rounded, size: 20),
        ],
      ),
    );
  }
}

class _BackgroundMesh extends StatelessWidget {
  const _BackgroundMesh();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MeshGradientPainter(),
    );
  }
}

class MeshGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Top Left radial
    paint.shader = RadialGradient(
      center: Alignment.topLeft,
      radius: 1.2,
      colors: [
        AppColors.primary.withOpacity(0.12),
        Colors.transparent,
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Bottom Right radial
    paint.shader = RadialGradient(
      center: Alignment.bottomRight,
      radius: 1.0,
      colors: [
        AppColors.primary.withOpacity(0.08),
        Colors.transparent,
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
