import 'dart:ui';

import 'package:cuponsito_app/app/modules/common/ui/widgets/responsive_layout.dart';
import 'package:cuponsito_app/config/config.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background Image
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuA7YDL9rlKMQFN0bu6P_P1IarJxHx7NCjr4MzQae4IeQqdZtgbFBwivRSQgtKvGizZ48WpFUaA9Rjh4nNlFzOyYxzXKYnzLXfNdWu1CCLw3Mvn_OZCOkPlRuhPWLKPn2xkuEIKP0tT7v9U_HARMxU-7CgbZ7V2Yf0kqsTNKYpPgaFVZVSoPZi4HJkzKEY9JnSamgd7zV_hQPq7g3wiHXRZ25aOJqDAToqSy3IWRLQcW6_v2L46YecUH8moUyI_D0a36KeRAcu1IQKZq',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: Icon(Icons.error, color: Colors.white)),
          ),

          // 2. Gradient Overlay
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.homeOverlayGradient,
            ),
          ),

          // 3. Top Safe Area gradient (subtle fade from top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100, // approximated
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 4. Main Content
          const SafeArea(
            child: ResponsiveLayout(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _LogoSection(),
                    Spacer(),
                    _TextContentSection(),
                    SizedBox(height: 32),
                    _ActionButtonsSection(),
                    SizedBox(height: 16),
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

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Circle
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.local_activity,
                  color: AppColors.backgroundDark,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              // Text
              const Text(
                'CUPONEA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800, // ExtraBold
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextContentSection extends StatelessWidget {
  const _TextContentSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ahorra mientras apoyas lo local',
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontSize: 36, // ~4xl
                fontWeight: FontWeight.w800,
                height: 1.1,
                shadows: [
                  const Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    color: Colors.black26,
                  ),
                ],
              ) ??
              const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Encuentra los mejores cupones y promociones cerca de ti',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.9), // white/90
            fontSize: 18,
            fontWeight: FontWeight.w500, // Medium
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _ActionButtonsSection extends StatelessWidget {
  const _ActionButtonsSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Register Button
          SizedBox(
            width: double.infinity,
            height: 64, // h-16
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.backgroundDark,
                elevation: 10,
                shadowColor: AppColors.primary.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999), // full
                ),
              ),
              child: const Text(
                'Registrarse',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Login Glass Button
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Bottom Indicator
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white60, size: 16),
              SizedBox(width: 8),
              Text(
                'Descubre ofertas en tu ciudad',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
