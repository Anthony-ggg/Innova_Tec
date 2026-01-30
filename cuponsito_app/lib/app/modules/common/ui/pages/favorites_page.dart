import 'dart:ui';

import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Stack(
        children: [
          // Content List
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 100, // Space for header
              bottom: 120, // Space for navbar
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                _BusinessCard(
                  isDark: isDark,
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA1hSFxsKrkSvNqyBBzgQgyu_J8kXWho2ctHF37cE368gKEB-tDSkaYhO49kMVuBtQvaj_Zjmxx5WlAKtKhetU3lE0bFTTVuEY2QIa3j9OwHBgIlsiWoofCo6iawDmBTtjkLtUe6PBNiOpcR0-g5_P6da82s8MC8F76kW-tLqtzGZx-TX06NAqdu-Ge_3pHqpEwgeK4Ix4zOXu5xOZU5u9ll3I-FWKOWfLXGc2b0Dk9Wu7IK5ZwIWHiJ0hxQEqh_I_DY_6La1hSH6KQ',
                  category: 'Comida y Bebida',
                  name: 'Pizzería Roma',
                  phone: '+39 06 123 4567',
                  icon: Icons.restaurant,
                ),
                const SizedBox(height: 16),
                _BusinessCard(
                  isDark: isDark,
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDNQN7xI6NxBMzSTAs6YCrhzSlA-3hIqi9chgDHEGqf400uZ34g6VtDWTBeaS3UbLHYH_vTdJZn-9rbTDjHgUMhUS0JRspSnyRE4Ngxse63k3P76YXGFpG1VuTrxH8AEekHoMFc6z-JKdxK2mQ1uaGblsgO5GXZkq2WcACetHeRqsbDB1RXlRek5Jk-jUagJXoMFw_4135vIs3aQ-HJHZ70TYL01GY-lLQaKHqEp2Iy0ikJ8W2HPCyRJnHxW9aAkYAhJl2VvGls4f72',
                  category: 'Moda',
                  name: 'Urban Style Boutique',
                  phone: '+39 06 987 6543',
                  icon: Icons.checkroom,
                ),
                const SizedBox(height: 16),
                _BusinessCard(
                  isDark: isDark,
                  imageUrl: '', // Placeholder for icon fallback
                  category: 'Bienestar',
                  name: 'Green Spa Retreat',
                  phone: '+39 06 444 2222',
                  icon: Icons.spa,
                  useIconPlaceholder: true,
                ),
                const SizedBox(height: 16),
                _BusinessCard(
                  isDark: isDark,
                  imageUrl: '', // Placeholder for icon fallback
                  category: 'Deportes',
                  name: 'FitLife Studio',
                  phone: '+39 06 555 7777',
                  icon: Icons.fitness_center,
                  useIconPlaceholder: true,
                  showButton: true,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Negocios Favoritos',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? const Color(0xFF1E293B)
                                  : Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: Border.all(
                                color: isDark
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.black.withOpacity(0.05),
                              ),
                            ),
                            child: Icon(
                              Icons.search,
                              color: isDark
                                  ? Colors.grey[300]
                                  : Colors.grey[600],
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Gestiona tus tiendas guardadas',
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark
                                  ? Colors.grey[400]
                                  : Colors.grey[500],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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

class _BusinessCard extends StatelessWidget {
  final bool isDark;
  final String imageUrl;
  final String category;
  final String name;
  final String phone;
  final IconData icon;
  final bool useIconPlaceholder;
  final bool showButton;

  const _BusinessCard({
    required this.isDark,
    required this.imageUrl,
    required this.category,
    required this.name,
    required this.phone,
    required this.icon,
    this.useIconPlaceholder = false,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/business-detail');
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.05)
                : const Color(0xFFF1F5F9),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image / Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isDark
                    ? const Color(0xFF334155)
                    : const Color(0xFFF1F5F9),
                image: (!useIconPlaceholder && imageUrl.isNotEmpty)
                    ? DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: (useIconPlaceholder || imageUrl.isEmpty)
                  ? Icon(
                      icon,
                      size: 32,
                      color: isDark ? Colors.grey[400] : Colors.grey[400],
                    )
                  : null,
            ),
            const SizedBox(width: 16),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                      height: 1.1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        size: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        phone,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.grey[400] : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action (Decorative or Visual Indicator)
            TextButton(
              onPressed: () {
                // Navigation handled by parent GestureDetector, or keep it explicitly here too if desired
                Navigator.pushNamed(context, '/business-detail');
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: IconButton(
                onPressed: () {
                  // Navigation handled by parent GestureDetector
                  Navigator.pushNamed(context, '/business-detail');
                },
                icon: Icon(
                  Iconsax.arrow_right_2,
                  color: isDark ? Colors.grey[500] : Colors.grey[300],
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
