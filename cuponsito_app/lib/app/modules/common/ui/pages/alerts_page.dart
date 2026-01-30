import 'dart:ui';

import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Glow effect
          Positioned(
            right: -100,
            bottom: 100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 80,
              bottom: 120, // Space for navbar
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section: Hoy
                _SectionTitle(title: 'Hoy', isDark: isDark),
                const SizedBox(height: 16),

                _NotificationCard(
                  isDark: isDark,
                  icon: Icons.local_offer,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.primary.withOpacity(0.1),
                  title: '¡Nuevo Cupón!',
                  tag: 'AHORRO',
                  time: 'Hace 2 min • Pizzería Roma',
                  description:
                      'Obtén 20% de descuento en tu próxima pizza familiar.',
                  hasDot: true,
                ),
                const SizedBox(height: 16),

                _NotificationCard(
                  isDark: isDark,
                  icon: Icons.verified_user,
                  iconColor: Colors.blue,
                  iconBgColor: Colors.blue.withOpacity(0.1),
                  title: 'Negocio Verificado',
                  time: 'Hace 1h',
                  description:
                      'Tu perfil de negocio ha sido validado exitosamente. Ahora eres un comercio certificado.',
                  hasDot: false,
                ),

                const SizedBox(height: 32),

                // Section: Esta semana
                _SectionTitle(title: 'Esta semana', isDark: isDark),
                const SizedBox(height: 16),

                _NotificationCard(
                  isDark: isDark,
                  icon: Icons.bolt,
                  iconColor: Colors.amber,
                  iconBgColor: Colors.amber.withOpacity(0.1),
                  title: 'Oferta Relámpago',
                  time: 'Ayer • Boutique Bella',
                  description:
                      'Solo por hoy: 2x1 en toda la colección de verano. ¡No te lo pierdas!',
                  hasDot: true,
                ),
                const SizedBox(height: 16),

                _NotificationCard(
                  isDark: isDark,
                  icon: Icons.update,
                  iconColor: Colors.grey,
                  iconBgColor: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                  title: 'Actualización disponible',
                  time: 'Hace 3 días',
                  description:
                      'Hemos mejorado la velocidad del mapa y corregido errores menores.',
                  hasDot: false,
                ),
              ],
            ),
          ),

          // Sticky Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    MediaQuery.of(context).padding.top + 16,
                    20,
                    16,
                  ),
                  decoration: BoxDecoration(
                    color:
                        (isDark
                                ? AppColors.backgroundDark
                                : AppColors.backgroundLight)
                            .withOpacity(0.8),
                    border: Border(
                      bottom: BorderSide(
                        color: isDark
                            ? Colors.white.withOpacity(0.05)
                            : Colors.black.withOpacity(0.05),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notificaciones',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF111813),
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        child: const Text('MARCAR COMO LEÍDAS'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final bool isDark;

  const _SectionTitle({required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: isDark ? Colors.grey[200] : const Color(0xFF111813),
        letterSpacing: -0.5,
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final bool isDark;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String? tag;
  final String time;
  final String description;
  final bool hasDot;

  const _NotificationCard({
    required this.isDark,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    this.tag,
    required this.time,
    required this.description,
    required this.hasDot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161E1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : const Color(0xFFF1F5F9),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF111813),
                      ),
                    ),
                    if (tag != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          tag!,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppColors.primary
                                : const Color(0xFF078829),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[400] : Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[300] : Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // Dot
          if (hasDot)
            Container(
              margin: const EdgeInsets.only(top: 8, left: 8),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.6),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
