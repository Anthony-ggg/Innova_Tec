import 'package:cuponsito_app/app/modules/common/ui/widgets/quick_view_card.dart';
import 'package:cuponsito_app/app/modules/common/ui/widgets/responsive_layout.dart';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int? _selectedMarkerIndex;

  final List<Map<String, dynamic>> _businesses = [
    {
      'id': '1',
      'name': 'Pizzería Roma',
      'icon': Icons.local_pizza,
      'category': 'Comida',
      'type': MarkerType.primary,
      'top': 0.35,
      'left': 0.25,
      'image':
          'https://lh3.googleusercontent.com/p/AF1QipM5a5... (placeholder)', // Using valid URLs below
      'rating': '4.8',
      'distance': '300m',
      'discount': '20% OFF',
    },
    {
      'id': '2',
      'name': 'Urban Style',
      'icon': Icons.checkroom,
      'category': 'Ropa',
      'type': MarkerType.secondary,
      'top': 0.50,
      'left': 0.65,
      'image': '',
      'rating': '4.5',
      'distance': '1.2km',
      'discount': 'SALE',
    },
    {
      'id': '3',
      'name': 'Gasolinera Shell',
      'icon': Icons.local_gas_station,
      'category': 'Gasolina',
      'type': MarkerType.secondary,
      'top': 0.65,
      'left': 0.15,
      'image': '',
      'rating': '4.2',
      'distance': '2.5km',
      'discount': '- \$5.00',
    },
    {
      'id': '4',
      'name': 'Café Central',
      'icon': Icons.coffee,
      'category': 'Café',
      'type': MarkerType.primary,
      'top': 0.25,
      'left': 0.55,
      'image': '',
      'rating': '4.9',
      'distance': '500m',
      'discount': '2x1',
    },
    {
      'id': '5',
      'name': 'Tech World',
      'icon': Icons.devices,
      'category': 'Tecnología',
      'type': MarkerType.secondary,
      'top': 0.45,
      'left': 0.85,
      'image': '',
      'rating': '4.7',
      'distance': '800m',
      'discount': '15% OFF',
    },
    {
      'id': '6',
      'name': 'Farmacia Salud',
      'icon': Icons.local_pharmacy,
      'category': 'Salud',
      'type': MarkerType.secondary,
      'top': 0.55,
      'left': 0.08,
      'image': '',
      'rating': '4.6',
      'distance': '400m',
      'discount': '5% OFF',
    },
    {
      'id': '7',
      'name': 'Supermercado',
      'icon': Icons.shopping_cart,
      'category': 'Comida',
      'type': MarkerType.secondary,
      'top': 0.80,
      'left': 0.70,
      'image': '',
      'rating': '4.3',
      'distance': '1.5km',
      'discount': 'OFERTAS',
    },
  ];

  void _onMarkerTap(int index) {
    setState(() {
      _selectedMarkerIndex = index;
    });
  }

  void _onMapTap() {
    if (_selectedMarkerIndex != null) {
      setState(() {
        _selectedMarkerIndex = null;
      });
    }
  }

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
            child: GestureDetector(
              onTap: _onMapTap,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDNQN7xI6NxBMzSTAs6YCrhzSlA-3hIqi9chgDHEGqf400uZ34g6VtDWTBeaS3UbLHYH_vTdJZn-9rbTDjHgUMhUS0JRspSnyRE4Ngxse63k3P76YXGFpG1VuTrxH8AEekHoMFc6z-JKdxK2mQ1uaGblsgO5GXZkq2WcACetHeRqsbDB1RXlRek5Jk-jUagJXoMFw_4135vIs3aQ-HJHZ70TYL01GY-lLQaKHqEp2Iy0ikJ8W2HPCyRJnHxW9aAkYAhJl2VvGls4f72',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE5E7EB), // Standard map grey
                  child: const Center(child: Text('Cargando mapa...')),
                ),
              ),
            ),
          ),

          // 2. Dynamic Markers
          ..._businesses.asMap().entries.map((entry) {
            final index = entry.key;
            final business = entry.value;
            // Use LayoutBuilder equivalent logic by using Positioned with percentages of screen size?
            // Positioned works with exact pixels or relative if inside a stack.
            // But to use fractions, we need to know the size or use Align in Positioned.fill.
            // Actually, Align is easier for relative positioning.

            return Positioned(
              top:
                  MediaQuery.of(context).size.height *
                  (business['top'] as double),
              left:
                  MediaQuery.of(context).size.width *
                  (business['left'] as double),
              child: GestureDetector(
                onTap: () => _onMarkerTap(index),
                child: _AnimatedMapMarker(
                  icon: business['icon'] as IconData,
                  type: business['type'] as MarkerType,
                  label: business['name'] as String,
                  isSelected: _selectedMarkerIndex == index,
                ),
              ),
            );
          }).toList(),

          // User Location Marker (Center)
          Align(
            alignment: const Alignment(0, 0.1),
            child: const _UserLocationMarker(),
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
                              height: 52,
                              decoration: BoxDecoration(
                                color:
                                    (isDark
                                            ? AppColors.backgroundDark
                                            : Colors.white)
                                        .withOpacity(0.95),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white10
                                      : Colors.black.withOpacity(0.05),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 15,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    color: isDark
                                        ? Colors.grey[400]
                                        : Colors.grey[500],
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            'Buscar restaurantes, tiendas...',
                                        hintStyle: TextStyle(
                                          color: isDark
                                              ? Colors.grey[500]
                                              : Colors.grey[400],
                                          fontSize: 15,
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
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 24,
                                    color: isDark
                                        ? Colors.white10
                                        : Colors.grey[200],
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.mic_none_rounded,
                                    color: isDark
                                        ? Colors.grey[400]
                                        : Colors.grey[500],
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Filter Button
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.tune,
                              color: Color(0xFF0F172A),
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
                            label: 'Comida',
                            isSelected: true,
                            isDark: isDark,
                          ),
                          const SizedBox(width: 8),
                          _CategoryChip(
                            icon: Icons.shopping_bag,
                            label: 'Tiendas',
                            isSelected: false,
                            isDark: isDark,
                          ),
                          const SizedBox(width: 8),
                          _CategoryChip(
                            icon: Icons.local_gas_station,
                            label: 'Gasolina',
                            isSelected: false,
                            isDark: isDark,
                          ),
                          const SizedBox(width: 8),
                          _CategoryChip(
                            icon: Icons.local_pharmacy,
                            label: 'Salud',
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
            bottom: _selectedMarkerIndex != null
                ? 300
                : 200, // Adjust based on card visibility
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Column(
                children: [
                  // Zoom controls container
                  Container(
                    width: 48,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
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
                        ),
                        Divider(
                          height: 1,
                          indent: 10,
                          endIndent: 10,
                          color: isDark ? Colors.white10 : Colors.grey[100],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: isDark ? Colors.grey[300] : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Current Location Button
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
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
                      Icons.near_me_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 5. Quick View Card (Floating) with Animation
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSlide(
              offset: _selectedMarkerIndex != null
                  ? const Offset(0, 0)
                  : const Offset(0, 2),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: ResponsiveLayout(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100.0,
                  ),
                  child: _selectedMarkerIndex != null
                      ? QuickViewCard(
                          business: _businesses[_selectedMarkerIndex!],
                        )
                      : const SizedBox.shrink(),
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

class _AnimatedMapMarker extends StatelessWidget {
  final IconData icon;
  final MarkerType type;
  final String label;
  final bool isSelected;

  const _AnimatedMapMarker({
    required this.icon,
    required this.type,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPrimary = type == MarkerType.primary;

    // Scale animation implied by reacting to isSelected
    final double scale = isSelected ? 1.2 : 1.0;

    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : (isDark ? const Color(0xFF1E293B) : Colors.white),
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Colors.white
                    : (isPrimary
                          ? AppColors.primary
                          : (isDark ? Colors.grey[600]! : Colors.grey[400]!)),
                width: isSelected ? 3 : 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: (isSelected ? AppColors.primary : Colors.black)
                      .withOpacity(0.3),
                  blurRadius: isSelected ? 12 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 20,
              color: isSelected
                  ? const Color(0xFF0F172A)
                  : (isPrimary
                        ? AppColors.primary
                        : (isDark ? Colors.grey[300] : Colors.grey[600])),
            ),
          ),
          // Triangle pointer
          ClipPath(
            clipper: _TriangleClipper(),
            child: Container(
              width: 10,
              height: 8,
              color: isSelected
                  ? AppColors.primary
                  : (isPrimary
                        ? AppColors.primary
                        : (isDark ? Colors.grey[600]! : Colors.grey[400]!)),
            ),
          ),
          // Optional Label if selected
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isDark ? Colors.black87 : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _UserLocationMarker extends StatelessWidget {
  const _UserLocationMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Larger touch area
      height: 60,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pulse effect
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
          ),
        ],
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
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary
            : (isDark ? const Color(0xFF1E293B) : Colors.white),
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? null
            : Border.all(
                color: isDark ? Colors.white10 : Colors.grey[200]!,
              ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [
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
            size: 18,
            color: isSelected
                ? const Color(0xFF102216)
                : (isDark ? Colors.white : Colors.grey[700]),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? const Color(0xFF102216)
                  : (isDark ? Colors.white : Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
