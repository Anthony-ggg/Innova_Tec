import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileClientPage extends StatelessWidget {
  const ProfileClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Perfil',
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF111813),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: isDark
            ? AppColors.backgroundDark
            : AppColors.backgroundLight,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: isDark ? Colors.grey[800] : Colors.grey[200],
            height: 1,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF27272A) : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: isDark ? Colors.white : const Color(0xFF111813),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Profile Header
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 128,
                        height: 128,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.2),
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuDa7fW5ppuwJ-9OuzFdetqnBURg7M475Q6R2cTipJg1Ch-pIpP13YN98j6kyhFW2rIJAPVpKTV2Vg8j5j8LXT7lhEK2MQnx5oOndJe5zutE9qIer63y3ePz7E9bx-ywx56lqRTFoEHA98rncAMAbfUj7R0aIVdx1BH34AgzWkAFIhnqpwBk_jQj_9cT0Mu3Ge5_80kRYlV43DoSBnk_3hWZYkqo0CN_BXqtwzvBfE1u04Cikt41OHJ915tpyG_Pgi-vsiDf16s542yg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark
                                  ? AppColors.backgroundDark
                                  : Colors.white,
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.verified,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Hola, Alejandro',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF111813),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Miembro desde 2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? AppColors.primary.withOpacity(0.7)
                          : const Color(0xFF61896F),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Stats Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      isDark: isDark,
                      icon: Icons.confirmation_number,
                      label: 'Cupones usados',
                      value: '12',
                      isPrimary: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _StatCard(
                      isDark: isDark,
                      icon: Icons.savings,
                      label: 'Ahorro total',
                      value: '\$45.00',
                      isPrimary: true,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categorías de interés',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF111813),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
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
                    icon: Icons.checkroom,
                    label: 'Ropa',
                    isSelected: false,
                    isDark: isDark,
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    icon: Icons.handyman,
                    label: 'Servicios',
                    isSelected: false,
                    isDark: isDark,
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    icon: Icons.devices,
                    label: 'Tecnología',
                    isSelected: true,
                    isDark: isDark,
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    icon: Icons.home,
                    label: 'Hogar',
                    isSelected: false,
                    isDark: isDark,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Activity Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Actividad reciente',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF111813),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _ActivityCard(
                    isDark: isDark,
                    icon: Icons.local_pizza,
                    title: 'Pizza Local Co.',
                    subtitle: 'Ayer • Cupón 2x1',
                    amount: '-\$12.50',
                  ),
                  const SizedBox(height: 12),
                  _ActivityCard(
                    isDark: isDark,
                    icon: Icons.shopping_bag,
                    title: 'Boutique Urbana',
                    subtitle: '15 Oct • 15% Desc.',
                    amount: '-\$8.00',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 120), // Bottom padding for navbar
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final bool isDark;
  final IconData icon;
  final String label;
  final String value;
  final bool isPrimary;

  const _StatCard({
    required this.isDark,
    required this.icon,
    required this.label,
    required this.value,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isPrimary
            ? (isDark
                  ? AppColors.primary.withOpacity(0.05)
                  : AppColors.primary.withOpacity(0.1))
            : (isDark ? const Color(0xFF27272A) : Colors.white),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPrimary
              ? AppColors.primary.withOpacity(0.2)
              : (isDark ? Colors.grey[800]! : Colors.grey[200]!),
        ),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isPrimary
                    ? AppColors.primary
                    : (isDark ? Colors.grey[500] : Colors.grey[400]),
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isPrimary
                        ? (isDark ? AppColors.primary : const Color(0xFF111813))
                        : (isDark ? Colors.grey[400] : Colors.grey[600]),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111813),
              letterSpacing: -0.5,
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
            : (isDark ? const Color(0xFF27272A) : Colors.white),
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? null
            : Border.all(
                color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
              ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected
                ? Colors.white
                : (isDark ? Colors.grey[500] : Colors.grey[500]),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : (isDark ? Colors.grey[300] : const Color(0xFF111813)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final bool isDark;
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;

  const _ActivityCard({
    required this.isDark,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF27272A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.grey[500],
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF111813),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
