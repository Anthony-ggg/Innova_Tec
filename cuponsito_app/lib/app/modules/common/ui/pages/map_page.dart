import 'package:cuponsito_app/app/modules/common/ui/widgets/quick_view_card.dart';
import 'package:cuponsito_app/app/modules/common/ui/widgets/responsive_layout.dart';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Map Background (Image simulation)
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDNQN7xI6NxBMzSTAs6YCrhzSlA-3hIqi9chgDHEGqf400uZ34g6VtDWTBeaS3UbLHYH_vTdJZn-9rbTDjHgUMhUS0JRspSnyRE4Ngxse63k3P76YXGFpG1VuTrxH8AEekHoMFc6z-JKdxK2mQ1uaGblsgO5GXZkq2WcACetHeRqsbDB1RXlRek5Jk-jUagJXoMFw_4135vIs3aQ-HJHZ70TYL01GY-lLQaKHqEp2Iy0ikJ8W2HPCyRJnHxW9aAkYAhJl2VvGls4f72',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: const Center(child: Text('Map Placeholder')),
              ),
            ),
          ),

          // 2. Simulated Markers (Absolute positioning)
          const Positioned(
            left: 100, // left-1/4 approx
            top: 250, // top-1/3 approx
            child: _MapMarker(
              icon: Icons.restaurant,
              type: MarkerType.primary,
            ),
          ),
          const Positioned(
            right: 130, // right-1/3 approx
            top: 400, // top-1/2 approx
            child: _MapMarker(
              icon: Icons.shopping_bag,
              type: MarkerType.secondary,
            ),
          ),

          // User Location Marker (Center)
          const Center(
            child: _UserLocationMarker(),
          ),

          // 3. Top Search Bar & Chips
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: ResponsiveLayout(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          // Search Input
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color:
                                    (isDark
                                            ? AppColors.backgroundDark
                                            : Colors.white)
                                        .withOpacity(0.95),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white10
                                      : Colors.black.withOpacity(0.05),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: isDark
                                        ? Colors.grey[400]
                                        : Colors.grey[500],
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            'Search for pizza, shopping...',
                                        hintStyle: TextStyle(
                                          color: isDark
                                              ? Colors.grey[500]
                                              : Colors.grey[400],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Filter Button
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color:
                                  (isDark
                                          ? AppColors.backgroundDark
                                          : Colors.white)
                                      .withOpacity(0.95),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDark
                                    ? Colors.white10
                                    : Colors.black.withOpacity(0.05),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.tune,
                              color: isDark
                                  ? Colors.grey[200]
                                  : Colors.grey[700],
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _CategoryChip(
                            icon: Icons.restaurant,
                            label: 'Food',
                            isSelected: true,
                            isDark: isDark,
                          ),
                          const SizedBox(width: 8),
                          _CategoryChip(
                            icon: Icons.shopping_bag,
                            label: 'Retail',
                            isSelected: false,
                            isDark: isDark,
                          ),
                          const SizedBox(width: 8),
                          _CategoryChip(
                            icon: Icons.local_gas_station,
                            label: 'Gas',
                            isSelected: false,
                            isDark: isDark,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Map Side Controls
          Positioned(
            right: 16,
            bottom: 200, // Adjusted to sit above QuickViewCard area
            child: Column(
              children: [
                // Zoom controls container
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E293B) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isDark
                          ? Colors.white10
                          : Colors.black.withOpacity(0.05),
                    ),
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: isDark ? Colors.grey[300] : Colors.grey[600],
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minHeight: 40),
                      ),
                      Divider(
                        height: 1,
                        color: isDark ? Colors.white10 : Colors.grey[100],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: isDark ? Colors.grey[300] : Colors.grey[600],
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minHeight: 40),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Current Location Button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E293B) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isDark
                          ? Colors.white10
                          : Colors.black.withOpacity(0.05),
                    ),
                  ),
                  child: const Icon(
                    Icons.near_me,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          // 5. Quick View Card (Floating) & Bottom Nav
          const Align(
            alignment: Alignment.bottomCenter,
            child: ResponsiveLayout(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 100.0,
                ), // Space for floating NavBar
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QuickViewCard(),
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

enum MarkerType { primary, secondary }

class _MapMarker extends StatelessWidget {
  final IconData icon;
  final MarkerType type;

  const _MapMarker({required this.icon, required this.type});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPrimary = type == MarkerType.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isPrimary
                  ? AppColors.primary
                  : (isDark ? Colors.grey[600]! : Colors.grey[400]!),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 20,
            color: isPrimary
                ? AppColors.primary
                : (isDark ? Colors.grey[300] : Colors.grey[600]),
          ),
        ),
        Container(
          width: 2,
          height: 8,
          color: isPrimary ? AppColors.primary : Colors.grey[400],
        ),
      ],
    );
  }
}

class _UserLocationMarker extends StatelessWidget {
  const _UserLocationMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isDark;

  const _CategoryChip({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary
            : (isDark ? const Color(0xFF1E293B) : Colors.white),
        borderRadius: BorderRadius.circular(99),
        border: isSelected
            ? null
            : Border.all(
                color: isDark ? Colors.white10 : Colors.grey[300]!,
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected
                ? const Color(0xFF102216)
                : (isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? const Color(0xFF102216)
                  : (isDark ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
