import 'dart:ui';
import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 80,
              bottom: 120,
            ), // Space for header and nav
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Trending Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tendencias',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: isDark ? Colors.white : AppColors.textDark,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'FAVORITOS DE LA COMUNIDAD',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'VER TODO',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Trending Carousel
                SizedBox(
                  height: 320,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _TrendingCard(
                        isDark: isDark,
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuB2HJofpoaRX_nArwTbheSFWdjKbTaJsD1QNyu2etObywIw5ma9TQ8ofwxoSmXo_-8fMJhBW-kOy28Vq7r_G1Ap6uXhU867wApX1Tq_B-JgdfJYxwfoAs1Tt91Dye8cG-VBEFUxZFzuT77IsHKaBUbxe7io_IiSYBfiT8hUlNalfgvyrF4aWKVBBMxIODVem52-J66S_B63UO6541zPew7uLCHsoeR8VFC7RqF_mRkO7rAZxS9anJhzDr9meG7EOcV67WsmeIs_W0i8',
                        discount: '80% DTO',
                        title: 'Burger Palace',
                        subtitle: 'Selección Premium • 1.2km',
                        tagIcon: Icons.local_fire_department,
                        tagLabel: 'Top',
                        badgeLabel: 'Tendencia',
                      ),
                      const SizedBox(width: 16),
                      _TrendingCard(
                        isDark: isDark,
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuCTnEuN926hHwjObInFH-H5barCe2vmIZySrjeBKXsCcodNuKghM9zIWwb99IxbQfzcgX8kmj3eCsXtkBQgyaOXq1Mx-XFs2wCV1taI8jgQyzSNSD_DVjRIyckU7F7jIw3w27NdT4bfjV9jrhbnzj9TBy9FyGY2GElxnqpl1saf_8EVJiKXrZ9YW7s4rlzYOtbMO4ymL2mGNwbmVnODIN7VsL-ZjD7q7f27-u1DGTrqAWuktQQbPZttwvqSGsO6pXKKYCT8TcvcjqK0',
                        discount: '70% DTO',
                        title: 'Iron Temple Gym',
                        subtitle: 'Pase Mensual • 0.8km',
                        tagIcon: Icons.bolt,
                        tagLabel: 'Oferta Flash',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 2. Ends Soon Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Termina Pronto',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: isDark ? Colors.white : AppColors.textDark,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.hourglass_top,
                              color: AppColors.primary,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'TIEMPO LIMITADO',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: isDark
                                    ? Colors.white
                                    : AppColors.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // List Items
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _CouponCard(
                        isDark: isDark,
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBEHW-u1LGb68iKQM1aPDvtowFyPyB20ADH2jk_QRno8UETg9omXaJeIrSLrEh12z7vmH7hluuA3jbFbbYM5oXLyddGa2F771l_ugoxtvW_PWTxdsmtz8T0wy6jQj27lswk5dk2NxsTDgD1P1dJN8jS6R4G1PJW30j1aXqYZkFPXY9akzi2HcgV1T9ozFSXnD_tTlsnC4F_qCAEL39EV4ywF0wleWPXxaTXEKTLVujuLCpp8dWllUqTRbd0h-ZJjIijPXHw6uVQa9_7',
                        storeName: 'Tech Gadget Hub',
                        title: 'Oferta Audio Inalámbrico',
                        badgeText: 'ÚLTIMAS UNIDADES',
                        badgeColor: Colors.red,
                        timeLeft: '00:15:22',
                        progress: 0.98,
                        itemsLeftText: 'Crítico: ¡Solo quedan 2!',
                        isCritical: true,
                        isPulse: true,
                      ),
                      const SizedBox(height: 16),
                      _CouponCard(
                        isDark: isDark,
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuC7emgT-oxp1AqRt4SxJDlLbHA1EK6xc31HHGvgPn0054_xGCfDmPYViqEMoEBV5BAnG4GzjgjpkMpqCWHa3aMLVBAxgA45IQmk0zmTJ1NG3YgrJEpyYBbjI2VTQcIGa4l9C1Oyo8Q7o3c5Yp8JtfJGo_eUNHY9IRamLNK6cf3zVE54O5Ep06qLaLObE4mT4VBVJ8DN9l174K8963pv-wL_FUHBBIHNCnLnxCoPu7iLFxBHIDBy-N70zWjLuXcY71_6Yb6haS8A8tf3',
                        storeName: 'Pizza Heaven',
                        title: '75% DTO Combo Familiar',
                        badgeText: 'OFERTÓN',
                        badgeColor: AppColors.primary,
                        timeLeft: '01:12:05',
                        progress: 0.85,
                        itemsLeftText: '¡Solo quedan 12!',
                        isCritical: false,
                        isPulse: false,
                      ),
                      const SizedBox(height: 16),
                      _CouponCard(
                        isDark: isDark,
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuCtbOHSP_RrAbWw6GBVu--k-ply16-Xyfyr__UGi5jAPQULxg_nwj_6Vc1Zbr3CNBEwvlwPkvhpLZeK1gWvr_9lTeQOspPwt2V4QJ9HDUUgdXPwiEdl9mH-BrCrKewbJVq5V5GQ8dZ9BP7FQDyWTbNkC136kyKZEjHf7l4UIPFX48u9u9xQbVYnBteUZrCVOmTn6-9KVCbYvmIlFfG9YjWWFk5j-fiwZudCB3qkNQOoUZMDXXX1NmWie9Q81X9pEOrog4j0vxBsZpf9',
                        storeName: 'Zen Wellness Center',
                        title: 'Terapia de Masaje Completa',
                        badgeText: 'POPULAR',
                        badgeColor: AppColors.primary,
                        timeLeft: '02:45:30',
                        progress: 0.40,
                        itemsLeftText: '45 cupones restantes',
                        isCritical: false,
                        isPulse: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Sticky Header
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
                    MediaQuery.of(context).padding.top + 8,
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
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.local_fire_department,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Mejores Ofertas',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: isDark ? Colors.white : AppColors.textDark,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.black.withOpacity(0.05),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1),
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                          color: isDark ? Colors.white : Colors.black87,
                          size: 22,
                        ),
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

class _TrendingCard extends StatelessWidget {
  final bool isDark;
  final String imageUrl;
  final String discount;
  final String title;
  final String subtitle;
  final IconData tagIcon;
  final String tagLabel;
  final String? badgeLabel;

  const _TrendingCard({
    required this.isDark,
    required this.imageUrl,
    required this.discount,
    required this.title,
    required this.subtitle,
    required this.tagIcon,
    required this.tagLabel,
    this.badgeLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF121813) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image with Gradient
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.srcOver,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) =>
                    Container(color: Colors.grey),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Tags
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            tagIcon,
                            size: 14,
                            color: AppColors.backgroundDark,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tagLabel.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: AppColors.backgroundDark,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (badgeLabel != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          badgeLabel!.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),

                // Bottom Text & Button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discount,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        color: AppColors.primary,
                        height: 1.0,
                        letterSpacing: -1.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.backgroundDark,
                          elevation: 0,
                          shadowColor: AppColors.primary.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        child: const Text('VER OFERTA'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CouponCard extends StatelessWidget {
  final bool isDark;
  final String imageUrl;
  final String storeName;
  final String title;
  final String badgeText;
  final Color badgeColor;
  final String timeLeft;
  final double progress;
  final String itemsLeftText;
  final bool isCritical;
  final bool isPulse;

  const _CouponCard({
    required this.isDark,
    required this.imageUrl,
    required this.storeName,
    required this.title,
    required this.badgeText,
    required this.badgeColor,
    required this.timeLeft,
    required this.progress,
    required this.itemsLeftText,
    required this.isCritical,
    required this.isPulse,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isPulse && isCritical
        ? Colors.red.withOpacity(0.3)
        : (isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.05));

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF121813) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) =>
                      Container(color: Colors.grey, width: 80, height: 80),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          storeName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: isDark
                                ? Colors.white.withOpacity(0.5)
                                : Colors.grey[600],
                            letterSpacing: 1.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: badgeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(
                              color: badgeColor.withOpacity(0.2),
                            ),
                          ),
                          child: Text(
                            badgeText,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: badgeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : AppColors.textDark,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.05)
                            : Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 14,
                            color: isCritical && isPulse
                                ? Colors.red
                                : AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 11,
                                color: isDark
                                    ? Colors.white
                                    : AppColors.textDark,
                              ),
                              children: [
                                const TextSpan(text: 'Termina en '),
                                TextSpan(
                                  text: timeLeft,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isCritical && isPulse
                                        ? Colors.red
                                        : AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Progress Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DISPONIBILIDAD',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? Colors.white.withOpacity(0.3)
                      : Colors.grey[400],
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                itemsLeftText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: isCritical ? Colors.red : AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.black.withOpacity(0.05),
              valueColor: AlwaysStoppedAnimation<Color>(
                isCritical ? Colors.red : AppColors.primary,
              ),
              minHeight: 6,
            ),
          ),

          const SizedBox(height: 16),

          // Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isCritical
                    ? const Color(0xFFDC2626)
                    : AppColors.primary,
                foregroundColor: isCritical
                    ? Colors.white
                    : AppColors.backgroundDark,
                elevation: 4,
                shadowColor: (isCritical ? Colors.red : AppColors.primary)
                    .withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                  fontSize: 12,
                ),
              ),
              child: const Text('RECLAMAR CUPÓN'),
            ),
          ),
        ],
      ),
    );
  }
}
