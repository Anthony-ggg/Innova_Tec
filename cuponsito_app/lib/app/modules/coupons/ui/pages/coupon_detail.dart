import 'dart:ui';

import 'package:cuponsito_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CouponDetailPage extends StatelessWidget {
  const CouponDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            (isDark ? AppColors.backgroundDark : AppColors.backgroundLight)
                .withOpacity(0.9),
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(color: Colors.transparent),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : const Color(0xFF111813),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cupón de Descuento',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF111813),
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: isDark ? Colors.white : const Color(0xFF111813),
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[200],
            height: 1,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: 120, // Space for fixed button
            ),
            child: Column(
              children: [
                // Headline Section
                Center(
                  child: Column(
                    children: [
                      Text(
                        '2x1 en Pizzas Medianas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF111813),
                          height: 1.1,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Válido solo hoy en sucursales participantes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.grey[400] : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // QR Code Container
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCqpm4dhm9Yj1DMHoOy38xqeCrGUO28PbHLg566gjm4Aip_TUh1doGt2l9wHbpswdLLY0RytHvyk79r9JUhDhuo9FoNU1QWR1PIFpkpme4lE99hF57elbcJjP2o_VJ4DdjVe5Kpb2SotAirJqBG7S80E_r0hEhXKRU_SDbVMyS6hhaqcVF3SEIyfElbbWbjzUO72WuYGHFcdCpubQsvmaNXosnqYxXXvgC8enCV-kXRXhcNXTwf669GThc1P6WVVVOpbyMEgi71fZB1',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'PX-992-881',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: const Color(0xFF111813),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Scarcity & Progress Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF161E1A) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.05)
                          : Colors.grey[100]!,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cupones disponibles',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF111813),
                            ),
                          ),
                          Text(
                            '12/50',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF111813),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: LinearProgressIndicator(
                          value: 0.24,
                          minHeight: 12,
                          backgroundColor: isDark
                              ? Colors.grey[800]
                              : Colors.grey[100],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.bolt,
                            size: 16,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              '¡Date prisa! Se están agotando rápido.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.primary
                                    : const Color(0xFF078829),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Countdown Timer
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.grey[200]!,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'EXPIRA EN:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: isDark ? Colors.grey[400] : Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            color: isDark ? Colors.grey[400] : Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '02:45:10',
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF111813),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Terms and Conditions
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Términos y condiciones',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF111813),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TermItem(
                        text: 'Válido únicamente para consumo en local.',
                        isDark: isDark,
                      ),
                      _TermItem(
                        text:
                            'No acumulable con otras promociones o descuentos.',
                        isDark: isDark,
                      ),
                      _TermItem(
                        text: 'Sujeto a disponibilidad de stock en tienda.',
                        isDark: isDark,
                      ),
                      _TermItem(
                        text:
                            'Válido solo para pizzas de especialidad clásica.',
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Fixed Bottom Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    MediaQuery.of(context).padding.bottom + 20,
                  ),
                  decoration: BoxDecoration(
                    color:
                        (isDark
                                ? AppColors.backgroundDark
                                : const Color(0xFFFFFFFF))
                            .withOpacity(0.8),
                    border: Border(
                      top: BorderSide(
                        color: isDark
                            ? Colors.white.withOpacity(0.05)
                            : Colors.grey[100]!,
                      ),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () => _launchWhatsApp(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: const Color(0xFF111813),
                      elevation: 8,
                      shadowColor: AppColors.primary.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.qr_code_scanner, size: 24),
                        SizedBox(width: 8),
                        Text(
                          'USAR CUPÓN',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchWhatsApp(BuildContext context) async {
    const phone = '593993114884'; // Replace with actual business number
    const message = '''
==============================
        🟢 CUPONCITO
==============================

📦 Detalles del pedido:

* 🍕 Pizza Mediana (2x1)
  Pizzería Roma
  Precio: \$18.00

------------------------------
🎟️ Cupón aplicado
Descuento: -\$18.00 (2x1 Gratis)
Ahorro aplicado con éxito ✅
------------------------------

💰 Subtotal:   \$36.00
💸 Descuento: -\$18.00
------------------------------
✅ Total final: \$18.00
(IVA incluido)

Gracias por apoyar a los negocios locales 💚
CUPONCITO — consume local, ahorra más
==============================
''';

    final whatsappUrl = Uri.parse(
      'whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}',
    );

    final webUrl = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );

    try {
      // 1. Intentar esquema nativo whatsapp://
      bool launched = false;

      // Verificamos si podemos abrirlo, pero si canLaunchUrl falla en algunos dispositivos
      // igual intentaremos el webUrl como fallback
      if (await canLaunchUrl(whatsappUrl)) {
        launched = await launchUrl(whatsappUrl);
      }

      // 2. Si no se pudo (o canLaunchUrl devolvió false), intentar enlace https con modo externo
      if (!launched) {
        // Para https, launchUrl suele funcionar mejor incluso sin canLaunchUrl previo en algunos casos
        launched = await launchUrl(
          webUrl,
          mode: LaunchMode.externalApplication,
        );
      }

      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No se pudo abrir WhatsApp. Verifica que esté instalado.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error al abrir WhatsApp: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al intentar abrir WhatsApp'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _TermItem extends StatelessWidget {
  final String text;
  final bool isDark;

  const _TermItem({required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 8),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[400] : Colors.grey[500],
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[400] : Colors.grey[500],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
