# Generador Universal de Iconos Multi-Flavor

Este script genera automáticamente los iconos para múltiples flavors (development, staging, production) en **TODAS las plataformas** soportadas por Flutter, siguiendo las mejores prácticas de Very Good CLI.

## 🌍 Plataformas Soportadas

- 🤖 **Android** - Iconos adaptivos en todas las densidades
- 🍎 **iOS** - AppIcon sets completos
- 🌐 **Web** - Favicon e iconos PWA
- 🖥️ **macOS** - AppIcon sets completos
- 🪟 **Windows** - Archivos .ico multi-tamaño
- 🐧 **Linux** - Iconos PNG en tamaños estándar

## 📋 Requisitos

- Flutter SDK
- Paquete `image` en dev_dependencies (ya incluido)
- Iconos fuente en `assets/icon/`:
  - `dev.png` - Icono para desarrollo
  - `stg.png` - Icono para staging
  - `prod.png` - Icono para producción

## 🚀 Uso

```bash
dart run tool/generate_flavor_icons.dart
```

El script generará automáticamente **192 archivos** de iconos para las 6 plataformas en menos de 20 segundos ⚡

## 📁 Estructura Generada

### 🤖 Android

Para cada flavor en `android/app/src/{flavor}/res/`:

```
{flavor}/res/
├── drawable/
│   └── ic_launcher_foreground.png (432x432)
├── mipmap-mdpi/
│   ├── ic_launcher.png (48x48)
│   └── ic_launcher_round.png (48x48)
├── mipmap-hdpi/
│   ├── ic_launcher.png (72x72)
│   └── ic_launcher_round.png (72x72)
├── mipmap-xhdpi/
│   ├── ic_launcher.png (96x96)
│   └── ic_launcher_round.png (96x96)
├── mipmap-xxhdpi/
│   ├── ic_launcher.png (144x144)
│   └── ic_launcher_round.png (144x144)
├── mipmap-xxxhdpi/
│   ├── ic_launcher.png (192x192)
│   └── ic_launcher_round.png (192x192)
├── mipmap-anydpi-v26/
│   ├── ic_launcher.xml
│   └── ic_launcher_round.xml
└── values/
    └── ic_launcher_background.xml
└── drawable/
    └── launch_background.xml (splash screen)
```

### 🍎 iOS

Para cada flavor en `ios/Runner/Assets.xcassets/`:

```
AppIcon.appiconset/          (production)
AppIcon-dev.appiconset/      (development)
AppIcon-stg.appiconset/      (staging)
├── 16.png
├── 32.png
├── 64.png
├── 128.png
├── 256.png
├── 512.png
├── 1024.png
└── Contents.json
```

### 🌐 Web

Para cada flavor:

```
web/icons/                   (production)
web/icons-development/       (development)
web/icons-staging/           (staging)
├── favicon.png (16x16)
├── Icon-192.png
└── Icon-512.png
```

### 🖥️ macOS

Para cada flavor en `macos/Runner/Assets.xcassets/`:

```
AppIcon.appiconset/          (production)
AppIcon-dev.appiconset/      (development)
AppIcon-stg.appiconset/      (staging)
├── 16.png
├── 32.png
├── 64.png
├── 128.png
├── 256.png
├── 512.png
├── 1024.png
└── Contents.json
```

### 🪟 Windows

Para cada flavor:

```
windows/runner/resources/           (production)
windows/runner/resources-development/
windows/runner/resources-staging/
├── app_icon.ico
└── app_icon_256.png
```

### 🐧 Linux

Para cada flavor:

```
linux/data/                  (production)
linux/data-development/
linux/data-staging/
├── app_icon_16.png
├── app_icon_32.png
├── app_icon_48.png
├── app_icon_64.png
├── app_icon_128.png
├── app_icon_256.png
└── app_icon_512.png
```

## ✨ Características

- ✅ **Android**: Genera iconos PNG en todas las densidades + iconos adaptivos (API 26+)
- ✅ **iOS**: Genera todos los tamaños necesarios (16-1024) + Contents.json automático
- ✅ **Web**: Genera favicon e iconos PWA (192, 512)
- ✅ **macOS**: Genera todos los tamaños para Mac (16-1024) + Contents.json
- ✅ **Windows**: Genera archivos .ico multi-tamaño + PNG de respaldo
- ✅ **Linux**: Genera iconos PNG en todos los tamaños estándar (16-512)
- ✅ **Redimensionamiento automático** con interpolación lineal de alta calidad
- ✅ **Iconos redondos** para Android generados automáticamente
- ✅ **Soporte completo para flavors** en las 6 plataformas

## 🔄 Cuándo Ejecutar

Ejecuta este script cada vez que:
- Cambies los iconos fuente en `assets/icon/`
- Agregues un nuevo flavor
- Necesites regenerar los iconos por cualquier motivo

## 📝 Compilación por Plataforma

### Android
```bash
flutter build apk --flavor development
flutter build apk --flavor staging
flutter build apk --flavor production
```

### iOS
```bash
flutter build ios --flavor development
flutter build ios --flavor staging
flutter build ios --flavor production
```

### Web
```bash
flutter build web --dart-define=FLAVOR=development
flutter build web --dart-define=FLAVOR=staging
flutter build web  # production
```

### macOS
```bash
flutter build macos --flavor development
flutter build macos --flavor staging
flutter build macos --flavor production
```

### Windows
```bash
flutter build windows --flavor development
flutter build windows --flavor staging
flutter build windows --flavor production
```

### Linux
```bash
flutter build linux --flavor development
flutter build linux --flavor staging
flutter build linux --flavor production
```

## ⚙️ Configuración Adicional

### Web - manifest.json

Para usar los iconos específicos por flavor en Web, actualiza `web/manifest.json`:

**Development:**
```json
{
  "icons": [
    {
      "src": "icons-development/Icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icons-development/Icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

**Staging:**
```json
{
  "icons": [
    {
      "src": "icons-staging/Icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icons-staging/Icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

### Windows - CMakeLists.txt

Para usar iconos específicos por flavor en Windows, actualiza el archivo de recursos en `windows/runner/CMakeLists.txt` para apuntar a `resources-{flavor}/app_icon.ico`.

### Linux - Configuración

Para usar iconos específicos por flavor en Linux, actualiza la configuración del desktop entry para apuntar a los iconos en `data-{flavor}/`.

## 🐛 Solución de Problemas

### Error: No se encontró el archivo assets/icon/xxx.png

Asegúrate de tener los tres iconos en la carpeta `assets/icon/`:
- `dev.png`
- `stg.png`
- `prod.png`

### Los iconos no aparecen después de compilar

**Android:**
1. Limpia el build: `flutter clean`
2. Regenera los iconos: `dart run tool/generate_flavor_icons.dart`
3. Compila de nuevo: `flutter build apk --flavor development`

**iOS:**
1. Abre el proyecto en Xcode
2. Verifica que los AppIcon sets estén en Assets.xcassets
3. Limpia el build: Product → Clean Build Folder
4. Compila de nuevo

**Web:**
1. Verifica que `manifest.json` apunte a los iconos correctos
2. Limpia el build: `flutter clean`
3. Compila de nuevo: `flutter build web`

**macOS:**
1. Abre el proyecto en Xcode
2. Verifica que los AppIcon sets estén en Assets.xcassets
3. Limpia el build: Product → Clean Build Folder
4. Compila de nuevo

**Windows:**
1. Verifica que CMakeLists.txt apunte al directorio correcto
2. Limpia el build: `flutter clean`
3. Compila de nuevo: `flutter build windows`

**Linux:**
1. Verifica la configuración del desktop entry
2. Limpia el build: `flutter clean`
3. Compila de nuevo: `flutter build linux`

## 📊 Estadísticas

**Iconos generados por ejecución:**
- Android: 36 archivos por flavor × 3 = **108 archivos**
- iOS: 8 archivos por flavor × 3 = **24 archivos**
- Web: 3 archivos por flavor × 3 = **9 archivos**
- macOS: 8 archivos por flavor × 3 = **24 archivos**
- Windows: 2 archivos por flavor × 3 = **6 archivos**
- Linux: 7 archivos por flavor × 3 = **21 archivos**

**Total: 192 archivos generados automáticamente** ⚡

## 📚 Referencias

- [Very Good CLI - Updating App Icons](https://cli.vgv.dev/docs/templates/core#updating-app-icons-)
- [Android - Providing Resources](https://developer.android.com/guide/topics/resources/providing-resources)
- [Android - Adaptive Icons](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive)
- [iOS - App Icons](https://developer.apple.com/design/human-interface-guidelines/foundations/app-icons)
- [Web - PWA Icons](https://web.dev/add-manifest/)
- [Windows - App Icons](https://docs.microsoft.com/en-us/windows/apps/design/style/iconography/app-icon-construction)
- [Linux - Icon Theme Specification](https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html)
- [Material Design - Product Icons](https://material.io/design/iconography/)

---

**💡 Tip:** Ejecuta este script como parte de tu pipeline de CI/CD para asegurar que los iconos siempre estén actualizados antes de cada build.
