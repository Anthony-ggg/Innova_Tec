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
    const SizedBox(
      height: 500,
      child: Center(
        child: Text('Coupons'),
      ),
    ), // Placeholder for Coupons
    const SizedBox(
      height: 500,
      child: Center(
        child: Text('Favorites'),
      ),
    ), // Placeholder for Favorites
    const SizedBox(
      height: 500,
      child: Center(
        child: Text('Alerts'),
      ),
    ), // Placeholder for Alerts
    const SizedBox(
      height: 500,
      child: Center(
        child: Text('Profile'),
      ),
    ), // Placeholder for Profile
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
        iconsList: const [
          Icons.map,
          Icons.confirmation_number_outlined,
          Icons.favorite_border,
          Icons.notifications_none,
          Icons.person_outline,
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
