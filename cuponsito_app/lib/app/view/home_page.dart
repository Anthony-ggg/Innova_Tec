import 'package:cuponsito_app/app/modules/client/pages/ui/profile_client_page.dart';
import 'package:cuponsito_app/app/modules/common/ui/pages/alerts_page.dart';
import 'package:cuponsito_app/app/modules/common/ui/pages/coupons_page.dart';
import 'package:cuponsito_app/app/modules/common/ui/pages/favorites_page.dart';
import 'package:cuponsito_app/app/modules/common/ui/pages/map_page.dart';
import 'package:cuponsito_app/app/modules/common/ui/widgets/buttonNavigatorBar.dart';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MapPage(),
    const CouponsPage(), // Placeholder for Coupons
    const FavoritesPage(), // Favorites Page
    const AlertsPage(), // Alerts Page
    const ProfileClientPage(), // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true, // Important for the floating nav bar to sit on top
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: _pages[_currentIndex],
      bottomNavigationBar: ButtonNavigatorBar(
        initialIndex: _currentIndex,
        items: const [
          CustomBottomNavItem(icon: Icons.map_rounded, label: 'Mapa'),
          CustomBottomNavItem(
            icon: Icons.confirmation_number_rounded,
            label: 'Cupones',
          ),
          CustomBottomNavItem(icon: Icons.favorite_rounded, label: 'Favoritos'),
          CustomBottomNavItem(
            icon: Icons.notifications_rounded,
            label: 'Alertas',
            hasBadge: true,
          ),
          CustomBottomNavItem(icon: Icons.person_rounded, label: 'Perfil'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
