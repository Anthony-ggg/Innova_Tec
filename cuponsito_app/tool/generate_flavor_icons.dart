// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as img;

/// Script para generar iconos para múltiples flavors en TODAS las plataformas
///
/// Este script crea iconos para:
/// - Android: Iconos adaptivos en todas las densidades
/// - iOS: AppIcon sets para cada flavor
/// - Web: Favicon e iconos PWA
/// - macOS: AppIcon sets para cada flavor
/// - Windows: Archivos .ico
/// - Linux: Iconos PNG en diferentes tamaños
///
/// Requisitos:
///   - Agregar 'image: ^4.0.0' en dev_dependencies del pubspec.yaml
///   - Tener los iconos fuente en assets/icon/
///
/// Uso: dart run tool/generate_flavor_icons.dart

void main() async {
  print(
    '🎨 Generando iconos para múltiples flavors en TODAS las plataformas...\n',
  );

  // Configuración de flavors y sus iconos
  final flavors = {
    'development': 'assets/icon/dev.png',
    'staging': 'assets/icon/stg.png',
    'production': 'assets/icon/prod.png',
  };

  // Verificar que existen las imágenes fuente
  for (final entry in flavors.entries) {
    final iconFile = File(entry.value);
    if (!iconFile.existsSync()) {
      print('❌ Error: No se encontró el archivo ${entry.value}');
      print(
        '   Por favor, asegúrate de tener los iconos en la carpeta assets/icon/',
      );
      exit(1);
    }
  }

  // Generar iconos para cada flavor
  for (final entry in flavors.entries) {
    final flavor = entry.key;
    final iconPath = entry.value;

    print('📱 Generando iconos para flavor: $flavor\n');

    // Android
    print('  🤖 Android:');
    await _generateAndroidIcons(flavor, iconPath);

    // iOS
    print('\n  🍎 iOS:');
    await _generateIOSIcons(flavor, iconPath);

    // Web
    print('\n  🌐 Web:');
    await _generateWebIcons(flavor, iconPath);

    // macOS
    print('\n  🖥️  macOS:');
    await _generateMacOSIcons(flavor, iconPath);

    // Windows
    print('\n  🪟 Windows:');
    await _generateWindowsIcons(flavor, iconPath);

    // Linux
    print('\n  🐧 Linux:');
    await _generateLinuxIcons(flavor, iconPath);

    print('\n✅ Iconos generados para $flavor\n');
    print('${'─' * 60}\n');
  }

  print('🎉 ¡Todos los iconos han sido generados exitosamente!');
  print('\n📝 Próximos pasos:');
  print('   Android: flutter build apk --flavor development');
  print('   iOS: flutter build ios --flavor development');
  print('   Web: flutter build web --dart-define=FLAVOR=development');
  print('   macOS: flutter build macos --flavor development');
  print('   Windows: flutter build windows --flavor development');
  print('   Linux: flutter build linux --flavor development');
}

// ============================================================================
// ANDROID
// ============================================================================

Future<void> _generateAndroidIcons(String flavor, String iconPath) async {
  final baseDir = 'android/app/src/$flavor/res';

  // Cargar la imagen fuente
  final sourceBytes = await File(iconPath).readAsBytes();
  final sourceImage = img.decodeImage(sourceBytes);

  if (sourceImage == null) {
    print('     ❌ Error: No se pudo decodificar la imagen $iconPath');
    return;
  }

  // Configuración de densidades y tamaños
  final densities = {
    'mdpi': 48,
    'hdpi': 72,
    'xhdpi': 96,
    'xxhdpi': 144,
    'xxxhdpi': 192,
  };

  // Generar iconos PNG para cada densidad
  for (final entry in densities.entries) {
    final density = entry.key;
    final size = entry.value;

    final dir = Directory('$baseDir/mipmap-$density');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    // Redimensionar y guardar ic_launcher.png
    final resizedImage = img.copyResize(
      sourceImage,
      width: size,
      height: size,
      interpolation: img.Interpolation.linear,
    );

    final launcherFile = File('${dir.path}/ic_launcher.png');
    await launcherFile.writeAsBytes(img.encodePng(resizedImage));

    // Crear versión redonda (circular)
    final roundImage = _createRoundIcon(resizedImage);
    final roundFile = File('${dir.path}/ic_launcher_round.png');
    await roundFile.writeAsBytes(img.encodePng(roundImage));
  }
  print('     ✓ Generados iconos PNG para todas las densidades');

  // Crear directorio para iconos adaptivos (API 26+)
  final anydpiDir = Directory('$baseDir/mipmap-anydpi-v26');
  if (!anydpiDir.existsSync()) {
    anydpiDir.createSync(recursive: true);
  }

  // Crear directorio para valores (color de fondo)
  final valuesDir = Directory('$baseDir/values');
  if (!valuesDir.existsSync()) {
    valuesDir.createSync(recursive: true);
  }

  // Crear archivos XML para iconos adaptivos
  await _createAdaptiveIconXml(anydpiDir.path, 'ic_launcher.xml');
  await _createAdaptiveIconXml(anydpiDir.path, 'ic_launcher_round.xml');

  // Crear archivo de color de fondo
  await _createBackgroundColorXml(valuesDir.path);

  // Crear foreground en mipmap-xxxhdpi (432x432 es el tamaño para xxxhdpi)
  final xxxhdpiDir = Directory('$baseDir/mipmap-xxxhdpi');
  if (!xxxhdpiDir.existsSync()) {
    xxxhdpiDir.createSync(recursive: true);
  }
  final foregroundSize = 432;
  final foreground = img.copyResize(
    sourceImage,
    width: foregroundSize,
    height: foregroundSize,
    interpolation: img.Interpolation.linear,
  );
  final foregroundFile = File('${xxxhdpiDir.path}/ic_launcher_foreground.png');
  await foregroundFile.writeAsBytes(img.encodePng(foreground));

  // Crear directorio drawable si no existe
  final drawableDir = Directory('$baseDir/drawable');
  if (!drawableDir.existsSync()) {
    drawableDir.createSync(recursive: true);
  }

  // Crear launch_background.xml específico para el flavor
  await _createLaunchBackgroundXml(drawableDir.path);

  print('     ✓ Archivos XML de iconos adaptivos y splash screen creados');
}

Future<void> _createLaunchBackgroundXml(String dirPath) async {
  final content = '''<?xml version="1.0" encoding="utf-8"?>
<!-- Generated by generate_flavor_icons.dart -->
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@android:color/white" />
    <item android:gravity="center" android:drawable="@mipmap/ic_launcher_foreground" />
</layer-list>
''';

  final file = File('$dirPath/launch_background.xml');
  await file.writeAsString(content);
}

img.Image _createRoundIcon(img.Image source) {
  final size = source.width;
  final center = size ~/ 2;
  final radius = center;

  final result = img.Image(width: size, height: size);

  // Crear máscara circular
  for (var y = 0; y < size; y++) {
    for (var x = 0; x < size; x++) {
      final dx = x - center;
      final dy = y - center;
      final distance = (dx * dx + dy * dy);

      if (distance <= radius * radius) {
        result.setPixel(x, y, source.getPixel(x, y));
      }
    }
  }

  return result;
}

Future<void> _createAdaptiveIconXml(String dirPath, String fileName) async {
  final content = '''<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@mipmap/ic_launcher_foreground"/>
</adaptive-icon>
''';

  final file = File('$dirPath/$fileName');
  await file.writeAsString(content);
}

Future<void> _createBackgroundColorXml(String dirPath) async {
  final content = '''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="ic_launcher_background">#FFFFFF</color>
</resources>
''';

  final file = File('$dirPath/ic_launcher_background.xml');
  await file.writeAsString(content);
}

// ============================================================================
// iOS
// ============================================================================

Future<void> _generateIOSIcons(String flavor, String iconPath) async {
  // Mapeo de flavors a nombres de AppIcon
  final appIconName = flavor == 'production'
      ? 'AppIcon'
      : 'AppIcon-${flavor == 'development' ? 'dev' : 'stg'}';
  final baseDir = 'ios/Runner/Assets.xcassets/$appIconName.appiconset';

  // Cargar la imagen fuente
  final sourceBytes = await File(iconPath).readAsBytes();
  final sourceImage = img.decodeImage(sourceBytes);

  if (sourceImage == null) {
    print('     ❌ Error: No se pudo decodificar la imagen $iconPath');
    return;
  }

  // Crear directorio si no existe
  final dir = Directory(baseDir);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Tamaños de iconos para iOS
  final sizes = [16, 32, 64, 128, 256, 512, 1024];

  for (final size in sizes) {
    final resizedImage = img.copyResize(
      sourceImage,
      width: size,
      height: size,
      interpolation: img.Interpolation.linear,
    );

    final file = File('$baseDir/$size.png');
    await file.writeAsBytes(img.encodePng(resizedImage));
  }
  print('     ✓ Generados iconos PNG para iOS (16-1024)');

  // Crear Contents.json
  await _createIOSContentsJson(baseDir);
  print('     ✓ Archivo Contents.json creado');
}

Future<void> _createIOSContentsJson(String dirPath) async {
  final contentsJson = {
    'images': [
      {
        'filename': '1024.png',
        'idiom': 'universal',
        'platform': 'ios',
        'size': '1024x1024',
      },
      {
        'filename': '16.png',
        'idiom': 'mac',
        'scale': '1x',
        'size': '16x16',
      },
      {
        'filename': '32.png',
        'idiom': 'mac',
        'scale': '2x',
        'size': '16x16',
      },
      {
        'filename': '32.png',
        'idiom': 'mac',
        'scale': '1x',
        'size': '32x32',
      },
      {
        'filename': '64.png',
        'idiom': 'mac',
        'scale': '2x',
        'size': '32x32',
      },
      {
        'filename': '128.png',
        'idiom': 'mac',
        'scale': '1x',
        'size': '128x128',
      },
      {
        'filename': '256.png',
        'idiom': 'mac',
        'scale': '2x',
        'size': '128x128',
      },
      {
        'filename': '256.png',
        'idiom': 'mac',
        'scale': '1x',
        'size': '256x256',
      },
      {
        'filename': '512.png',
        'idiom': 'mac',
        'scale': '2x',
        'size': '256x256',
      },
      {
        'filename': '512.png',
        'idiom': 'mac',
        'scale': '1x',
        'size': '512x512',
      },
      {
        'filename': '1024.png',
        'idiom': 'mac',
        'scale': '2x',
        'size': '512x512',
      },
      {
        'filename': '1024.png',
        'idiom': 'universal',
        'platform': 'watchos',
        'size': '1024x1024',
      },
    ],
    'info': {
      'author': 'xcode',
      'version': 1,
    },
  };

  final file = File('$dirPath/Contents.json');
  await file.writeAsString(
    const JsonEncoder.withIndent('  ').convert(contentsJson),
  );
}

// ============================================================================
// WEB
// ============================================================================

Future<void> _generateWebIcons(String flavor, String iconPath) async {
  // Para web, creamos directorios por flavor
  final baseDir = flavor == 'production' ? 'web/icons' : 'web/icons-$flavor';

  // Cargar la imagen fuente
  final sourceBytes = await File(iconPath).readAsBytes();
  final sourceImage = img.decodeImage(sourceBytes);

  if (sourceImage == null) {
    print('     ❌ Error: No se pudo decodificar la imagen $iconPath');
    return;
  }

  // Crear directorio si no existe
  final dir = Directory(baseDir);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Generar favicon (16x16)
  final favicon = img.copyResize(
    sourceImage,
    width: 16,
    height: 16,
    interpolation: img.Interpolation.linear,
  );
  await File('$baseDir/favicon.png').writeAsBytes(img.encodePng(favicon));
  print('     ✓ Generado favicon.png (16x16)');

  // Generar Icon-192.png
  final icon192 = img.copyResize(
    sourceImage,
    width: 192,
    height: 192,
    interpolation: img.Interpolation.linear,
  );
  await File('$baseDir/Icon-192.png').writeAsBytes(img.encodePng(icon192));
  print('     ✓ Generado Icon-192.png');

  // Generar Icon-512.png
  final icon512 = img.copyResize(
    sourceImage,
    width: 512,
    height: 512,
    interpolation: img.Interpolation.linear,
  );
  await File('$baseDir/Icon-512.png').writeAsBytes(img.encodePng(icon512));
  print('     ✓ Generado Icon-512.png');

  // Nota sobre manifest.json
  if (flavor != 'production') {
    print(
      '     ℹ️  Recuerda actualizar manifest.json para usar icons-$flavor/',
    );
  }
}

// ============================================================================
// macOS
// ============================================================================

Future<void> _generateMacOSIcons(String flavor, String iconPath) async {
  final appIconName = flavor == 'production'
      ? 'AppIcon'
      : 'AppIcon-${flavor == 'development' ? 'dev' : 'stg'}';
  final baseDir = 'macos/Runner/Assets.xcassets/$appIconName.appiconset';

  final sourceBytes = await File(iconPath).readAsBytes();
  final sourceImage = img.decodeImage(sourceBytes);

  if (sourceImage == null) {
    print('     ❌ Error: No se pudo decodificar la imagen $iconPath');
    return;
  }

  final dir = Directory(baseDir);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  final sizes = [16, 32, 64, 128, 256, 512, 1024];

  for (final size in sizes) {
    final resizedImage = img.copyResize(
      sourceImage,
      width: size,
      height: size,
      interpolation: img.Interpolation.linear,
    );

    final file = File('$baseDir/$size.png');
    await file.writeAsBytes(img.encodePng(resizedImage));
  }
  print('     ✓ Generados iconos PNG para macOS (16-1024)');

  await _createMacOSContentsJson(baseDir);
  print('     ✓ Archivo Contents.json creado');
}

Future<void> _createMacOSContentsJson(String dirPath) async {
  final contentsJson = {
    'images': [
      {'filename': '16.png', 'idiom': 'mac', 'scale': '1x', 'size': '16x16'},
      {'filename': '32.png', 'idiom': 'mac', 'scale': '2x', 'size': '16x16'},
      {'filename': '32.png', 'idiom': 'mac', 'scale': '1x', 'size': '32x32'},
      {'filename': '64.png', 'idiom': 'mac', 'scale': '2x', 'size': '32x32'},
      {'filename': '128.png', 'idiom': 'mac', 'scale': '1x', 'size': '128x128'},
      {'filename': '256.png', 'idiom': 'mac', 'scale': '2x', 'size': '128x128'},
      {'filename': '256.png', 'idiom': 'mac', 'scale': '1x', 'size': '256x256'},
      {'filename': '512.png', 'idiom': 'mac', 'scale': '2x', 'size': '256x256'},
      {'filename': '512.png', 'idiom': 'mac', 'scale': '1x', 'size': '512x512'},
      {
        'filename': '1024.png',
        'idiom': 'mac',
        'scale': '2x',
        'size': '512x512',
      },
    ],
    'info': {'author': 'xcode', 'version': 1},
  };

  final file = File('$dirPath/Contents.json');
  await file.writeAsString(
    const JsonEncoder.withIndent('  ').convert(contentsJson),
  );
}

// ============================================================================
// WINDOWS
// ============================================================================

Future<void> _generateWindowsIcons(String flavor, String iconPath) async {
  final baseDir = flavor == 'production'
      ? 'windows/runner/resources'
      : 'windows/runner/resources-$flavor';

  final sourceBytes = await File(iconPath).readAsBytes();
  final sourceImage = img.decodeImage(sourceBytes);

  if (sourceImage == null) {
    print('     ❌ Error: No se pudo decodificar la imagen $iconPath');
    return;
  }

  final dir = Directory(baseDir);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Generar archivo .ico con múltiples tamaños
  // Windows ICO soporta: 16, 32, 48, 256
  final icoSizes = [16, 32, 48, 256];
  final icoImages = <img.Image>[];

  for (final size in icoSizes) {
    final resized = img.copyResize(
      sourceImage,
      width: size,
      height: size,
      interpolation: img.Interpolation.linear,
    );
    icoImages.add(resized);
  }

  // Crear archivo ICO
  final icoFile = File('$baseDir/app_icon.ico');
  final icoBytes = img.encodeIco(
    icoImages.first,
  ); // Nota: image package tiene limitaciones con ICO
  await icoFile.writeAsBytes(icoBytes);

  print('     ✓ Generado app_icon.ico');

  // También generar PNGs individuales como respaldo
  for (final size in [256]) {
    final resized = img.copyResize(
      sourceImage,
      width: size,
      height: size,
      interpolation: img.Interpolation.linear,
    );
    final pngFile = File('$baseDir/app_icon_$size.png');
    await pngFile.writeAsBytes(img.encodePng(resized));
  }
  print('     ✓ Generado PNG de respaldo (256x256)');

  if (flavor != 'production') {
    print('     ℹ️  Para usar este icono, actualiza CMakeLists.txt');
  }
}

// ============================================================================
// LINUX
// ============================================================================

Future<void> _generateLinuxIcons(String flavor, String iconPath) async {
  final baseDir = flavor == 'production' ? 'linux/data' : 'linux/data-$flavor';

  final sourceBytes = await File(iconPath).readAsBytes();
  final sourceImage = img.decodeImage(sourceBytes);

  if (sourceImage == null) {
    print('     ❌ Error: No se pudo decodificar la imagen $iconPath');
    return;
  }

  final dir = Directory(baseDir);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Linux usa iconos en diferentes tamaños estándar
  final sizes = [16, 32, 48, 64, 128, 256, 512];

  for (final size in sizes) {
    final resized = img.copyResize(
      sourceImage,
      width: size,
      height: size,
      interpolation: img.Interpolation.linear,
    );
    final file = File('$baseDir/app_icon_$size.png');
    await file.writeAsBytes(img.encodePng(resized));
  }

  print('     ✓ Generados iconos PNG (16-512)');

  if (flavor != 'production') {
    print(
      '     ℹ️  Para usar estos iconos, actualiza la configuración de Linux',
    );
  }
}
