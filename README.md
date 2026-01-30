   git clone <url-del-repositorio>
   cd cuponcito_app
   ```

2. **Obtener dependencias**:
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```

## 📂 Estructura del Proyecto

```
cuponcito_app/
├── lib/
│   ├── main.dart             # Punto de entrada de la aplicación
│   ├── models/               # Modelos de datos (Coupon, Category, User)
│   ├── services/             # Servicios de red y base de datos
│   ├── screens/              # Pantallas de la aplicación
│   ├── widgets/              # Widgets reutilizables
│   └── utils/                # Utilidades y helpers
├── test/                     # Tests de la aplicación
├── pubspec.yaml              # Dependencias del proyecto
└── README.md                 # Este archivo
```

## 🧪 Tests

Para ejecutar los tests:

```bash
flutter test
