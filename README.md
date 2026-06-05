<div align="center">

<img src="https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg" width="120" alt="Flutter Logo"/>

# 🎬 Netflix Clone — Flutter UI

**Réplica fiel de la landing page de Netflix construida en Flutter**  
Diseño responsivo · Tipografías personalizadas · Assets locales · Animaciones nativas

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Google Fonts](https://img.shields.io/badge/Google_Fonts-6.2.1-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://pub.dev/packages/google_fonts)
[![License](https://img.shields.io/badge/License-MIT-red?style=for-the-badge)](LICENSE)

<br/>

> ⚡ Primera app Flutter con fuentes personalizadas, imágenes de fondo y stroke de texto nativo

</div>

---

## 🚀 Inicio rápido

### 1. Clonar el repositorio

```bash
git clone https://github.com/TU_USUARIO/netflix-flutter-clone.git
cd netflix-flutter-clone
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Agregar los assets

Crea la carpeta y agrega tus imágenes:

```
assets/
└── images/
    ├── hero.jpg       ← imagen de fondo del hero
    ├── poster1.jpg
    ├── poster2.jpg
    ├── poster3.jpg
    ├── poster4.jpg
    ├── poster5.jpg
    ├── poster6.jpg
    ├── poster7.jpg
    └── poster8.jpg
```

> 💡 Puedes usar cualquier imagen JPG. Las de Netflix se encuentran fácilmente en Google Imágenes buscando "Netflix poster".

### 4. Correr la app

```bash
flutter run
```

Para plataformas específicas:

```bash
flutter run -d chrome      # Web
flutter run -d android     # Android
flutter run -d ios         # iOS (requiere Mac)
flutter run -d windows     # Windows
```

---

## 🛠️ Requisitos previos

Antes de clonar, asegúrate de tener:

| Herramienta | Versión mínima | Link |
|-------------|---------------|------|
| Flutter SDK | 3.0.0+ | [flutter.dev/docs/get-started](https://flutter.dev/docs/get-started/install) |
| Dart SDK | 3.0.0+ | Incluido con Flutter |
| Git | Cualquiera | [git-scm.com](https://git-scm.com) |

Verifica tu instalación:

```bash
flutter doctor
```

---

## 📦 Dependencias

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
```

---

## ✨ Conceptos nuevos aplicados

### 🔤 1. Google Fonts desde `pubspec.yaml`
**Primera vez** configurando tipografías externas en un proyecto Flutter.  
Se definen 3 familias con roles semánticos claros:

| Fuente | Uso |
|--------|-----|
| **Playfair Display** | Títulos hero grandes |
| **Oswald** | Headers de sección y números de ranking |
| **Lato** | Cuerpo, inputs y navegación |

```yaml
# pubspec.yaml
dependencies:
  google_fonts: ^6.2.1
```

```dart
// Uso en código
GoogleFonts.oswald(fontSize: 80, fontWeight: FontWeight.w900)
GoogleFonts.playfairDisplay(fontSize: 48, fontWeight: FontWeight.w900)
GoogleFonts.lato(fontSize: 15, color: Colors.white)
```

---

### 🖼️ 2. Imágenes locales como fondo de pantalla
**Primera vez** declarando y usando assets locales.  
Se usa `Image.asset` dentro de un `Stack` con gradiente para lograr el efecto de imagen de fondo semitransparente estilo Netflix:

```yaml
# pubspec.yaml — declarar los assets
flutter:
  assets:
    - assets/images/
```

```dart
Stack(
  fit: StackFit.expand,
  children: [
    // Imagen de fondo
    Image.asset('assets/images/hero.jpg', fit: BoxFit.cover),
    // Gradiente encima
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xBB000000), Color(0x44000000), Color(0xFF000000)],
        ),
      ),
    ),
    // Contenido sobre todo lo anterior
    MiWidget(),
  ],
)
```

---

### 🔢 3. Texto con borde/stroke usando `Paint`
Flutter **no tiene** propiedad stroke nativa en `TextStyle`.  
La solución: usar `foreground: Paint()` y apilar dos capas de texto en un `Stack`:

```dart
Stack(
  children: [
    // Capa 1 — solo el borde blanco
    Text(
      rank,
      style: style.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = fontSize * 0.07   // 7% del tamaño
          ..strokeJoin = StrokeJoin.round
          ..color = Colors.white,
      ),
    ),
    // Capa 2 — relleno negro encima del borde
    Text(rank, style: style.copyWith(color: Color(0xFF141414))),
  ],
)
```

> Este es exactamente el mismo efecto visual que usa Netflix en su app real para los números del ranking.

---

### 📱 4. Diseño responsivo con `MediaQuery`
Toda la UI adapta layout, tamaños y paddings según el ancho de pantalla:

```dart
final isMobile = MediaQuery.of(context).size.width < 600;

// Ejemplo: columna en móvil, fila en desktop
isMobile
  ? Column(children: [...])
  : Row(children: [...]);
```

---

### 🎠 5. Carrusel horizontal con `ScrollController`
La sección *Tendencias* usa `ListView.separated` horizontal con flechas que aparecen y desaparecen dinámicamente según la posición del scroll:

```dart
_scrollCtrl.addListener(() {
  setState(() {
    _canScrollLeft = _scrollCtrl.offset > 8;
    _canScrollRight = _scrollCtrl.offset < _scrollCtrl.position.maxScrollExtent - 8;
  });
});
```

---

### ❓ 6. FAQ expandible con `StatefulWidget`
Acordeón clásico — cada item maneja su propio estado `_open` con `setState`:

```dart
InkWell(
  onTap: () => setState(() => _open = !_open),
  child: ...,
)
if (_open) Text(respuesta)
```

---

## 📁 Estructura del proyecto

```
netflix-flutter-clone/
│
├── lib/
│   └── main.dart              # Toda la lógica y UI (single-file architecture)
│
├── assets/
│   └── images/
│       ├── hero.jpg
│       ├── poster1.jpg
│       └── ... (poster2–poster8)
│
├── pubspec.yaml               # Dependencias y assets declarados
└── README.md
```

---

## 🎨 Sistema de diseño

### Colores

| Variable | Hex | Uso |
|----------|-----|-----|
| `NColor.red` | `#E50914` | Botones, badges, iconos |
| `NColor.black` | `#000000` | Fondo principal |
| `NColor.dark` | `#141414` | Relleno de números |
| `NColor.card` | `#1A1A2E` | Tarjetas de features |
| `NColor.grey` | `#B3B3B3` | Texto secundario |

### Tipografías

```
Playfair Display  →  Títulos hero
Oswald            →  Headers + números ranking  
Lato              →  Cuerpo + inputs + nav
```

---

<div align="center">

<img src="https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg" width="40"/>

*Built with Flutter*

</div>