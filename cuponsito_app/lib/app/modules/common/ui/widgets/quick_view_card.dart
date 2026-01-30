import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class QuickViewCard extends StatelessWidget {
  const QuickViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 80,
      ), // adjust for specific positioning
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1E293B)
            : Colors.white, // slate-800 or white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '20% OFF',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: isDark ? AppColors.primary : Colors.green[700],
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Title
                Text(
                  'Pizzería Roma',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: isDark
                        ? Colors.white
                        : const Color(0xFF0F172A), // slate-900
                  ),
                ),

                const SizedBox(height: 4),

                // Location info
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: isDark
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF64748B), // slate-400 : slate-500
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '300m away',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark
                            ? const Color(0xFF94A3B8)
                            : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: const Color(0xFF0F172A),
                    elevation: 1,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ), // compact
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.confirmation_number_outlined, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Get Coupon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Image
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuA1hSFxsKrkSvNqyBBzgQgyu_J8kXWho2ctHF37cE368gKEB-tDSkaYhO49kMVuBtQvaj_Zjmxx5WlAKtKhetU3lE0bFTTVuEY2QIa3j9OwHBgIlsiWoofCo6iawDmBTtjkLtUe6PBNiOpcR0-g5_P6da82s8MC8F76kW-tLqtzGZx-TX06NAqdu-Ge_3pHqpEwgeK4Ix4zOXu5xOZU5u9ll3I-FWKOWfLXGc2b0Dk9Wu7IK5ZwIWHiJ0hxQEqh_I_DY_6La1hSH6KQ',
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
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
