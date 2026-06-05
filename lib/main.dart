import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
      ),
      home: const LandingPage(),
    );
  }
}

// ─── COLORES ──────────────────────────────────────────────────────────────────
class NColor {
  static const red = Color(0xFFE50914);
  static const black = Color(0xFF000000);
  static const dark = Color(0xFF141414);
  static const card = Color(0xFF1A1A2E);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFB3B3B3);
  static const darkGrey = Color(0xFF2F2F2F);
}

// ─── TIPOGRAFÍAS ──────────────────────────────────────────────────────────────
class NFont {
  static TextStyle hero({double size = 48, Color color = NColor.white}) =>
      GoogleFonts.playfairDisplay(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: color,
        height: 1.2,
      );

  static TextStyle sectionTitle({
    double size = 22,
    Color color = NColor.white,
  }) => GoogleFonts.oswald(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: color,
    letterSpacing: 1,
  );

  static TextStyle body({double size = 15, Color color = NColor.grey}) =>
      GoogleFonts.lato(fontSize: size, color: color, height: 1.6);

  static TextStyle button({double size = 16}) => GoogleFonts.oswald(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: NColor.white,
    letterSpacing: 1,
  );

  static TextStyle nav({double size = 14, Color color = NColor.white}) =>
      GoogleFonts.lato(fontSize: size, color: color);

  static TextStyle logo({double size = 32}) => GoogleFonts.playfairDisplay(
    fontSize: size,
    fontWeight: FontWeight.w900,
    color: NColor.red,
    letterSpacing: 3,
  );
}

// ─── IMÁGENES ─────────────────────────────────────────────────────────────────
class NImages {
  static const hero = 'assets/images/hero.jpg';
  static const poster1 = 'assets/images/poster1.jpg';
  static const poster2 = 'assets/images/poster2.jpg';
  static const poster3 = 'assets/images/poster3.jpg';
  static const poster4 = 'assets/images/poster4.jpg';
  static const poster5 = 'assets/images/poster5.jpg';
  static const poster6 = 'assets/images/poster6.jpg';
  static const poster7 = 'assets/images/poster7.jpg';
  static const poster8 = 'assets/images/poster8.jpg';
  static const List<String> posters = [
    poster1,
    poster2,
    poster3,
    poster4,
    poster5,
    poster6,
    poster7,
    poster8,
  ];
  static const featureTV = poster6;
  static const featureDownload = poster7;
  static const featureDevices = poster8;
  static const featureKids = poster5;
}

// ─── LANDING PAGE ─────────────────────────────────────────────────────────────
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _email1 = TextEditingController();
  final _email2 = TextEditingController();

  @override
  void dispose() {
    _email1.dispose();
    _email2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NColor.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(emailController: _email1),
            const _TrendingSection(),
            const _FeaturesSection(),
            const _FaqSection(),
            _FooterCta(emailController: _email2),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

// ─── HERO ─────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  final TextEditingController emailController;
  const _HeroSection({required this.emailController});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 600;
    final heroH = isMobile ? 620.0 : 720.0;

    return SizedBox(
      height: heroH,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            NImages.hero,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: NColor.darkGrey),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xBB000000),
                  Color(0x44000000),
                  Color(0xCC000000),
                  Color(0xFF000000),
                ],
                stops: [0.0, 0.3, 0.7, 1.0],
              ),
            ),
          ),
          Column(
            children: [
              _Navbar(),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100),
                child: Column(
                  children: [
                    Text(
                      'Películas y series\nilimitadas y mucho más',
                      textAlign: TextAlign.center,
                      style: NFont.hero(size: isMobile ? 30 : 52),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'A partir de S/ 28.90. Cancela cuando quieras.',
                      textAlign: TextAlign.center,
                      style: NFont.body(
                        size: isMobile ? 15 : 20,
                        color: NColor.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '¿Quieres ver Netflix ya? Ingresa tu email para crear\nuna cuenta o reiniciar tu membresía.',
                      textAlign: TextAlign.center,
                      style: NFont.body(
                        size: isMobile ? 13 : 16,
                        color: NColor.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 28),
                    _EmailRow(controller: emailController, isMobile: isMobile),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── NAVBAR ───────────────────────────────────────────────────────────────────
class _Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('NETFLIX', style: NFont.logo(size: isMobile ? 22 : 32)),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: NColor.white.withOpacity(0.7)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.language, color: NColor.white, size: 15),
                    const SizedBox(width: 5),
                    Text('Español', style: NFont.nav(size: 12)),
                    const SizedBox(width: 3),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: NColor.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: NColor.red,
                  foregroundColor: NColor.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 18,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 0,
                ),
                child: Text('Iniciar sesión', style: NFont.button(size: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── EMAIL ROW ────────────────────────────────────────────────────────────────
class _EmailRow extends StatelessWidget {
  final TextEditingController controller;
  final bool isMobile;
  const _EmailRow({required this.controller, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: [
          _EmailField(controller: controller),
          const SizedBox(height: 12),
          _ComenzarButton(fullWidth: true),
        ],
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 320, child: _EmailField(controller: controller)),
        const SizedBox(width: 8),
        _ComenzarButton(fullWidth: false),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;
  const _EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: NFont.nav(color: NColor.white),
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: NFont.nav(color: NColor.grey),
        filled: true,
        fillColor: NColor.black.withOpacity(0.75),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: NColor.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: NColor.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: NColor.white, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),
    );
  }
}

class _ComenzarButton extends StatelessWidget {
  final bool fullWidth;
  const _ComenzarButton({required this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward_ios, size: 13),
        label: Text('Comenzar', style: NFont.button(size: 17)),
        style: ElevatedButton.styleFrom(
          backgroundColor: NColor.red,
          foregroundColor: NColor.white,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 0,
          iconAlignment: IconAlignment.end,
        ),
      ),
    );
  }
}

// ─── TRENDING ─────────────────────────────────────────────────────────────────
class _TrendingSection extends StatefulWidget {
  const _TrendingSection();
  @override
  State<_TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<_TrendingSection> {
  final ScrollController _scrollCtrl = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_updateArrows);
  }

  void _updateArrows() {
    setState(() {
      _canScrollLeft = _scrollCtrl.offset > 8;
      _canScrollRight =
          _scrollCtrl.offset < _scrollCtrl.position.maxScrollExtent - 8;
    });
  }

  void _scroll(double delta) {
    _scrollCtrl.animateTo(
      (_scrollCtrl.offset + delta).clamp(
        0,
        _scrollCtrl.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_updateArrows);
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final cardH = isMobile ? 150.0 : 200.0;
    final cardW = isMobile ? 100.0 : 140.0;

    return Container(
      color: NColor.black,
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: isMobile ? 12 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 4 : 0, bottom: 16),
            child: Text(
              'Tendencias',
              style: NFont.sectionTitle(size: isMobile ? 18 : 22),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: cardH,
                child: ListView.separated(
                  controller: _scrollCtrl,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 28),
                  itemCount: NImages.posters.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: isMobile ? 6 : 10),
                  itemBuilder: (context, i) => _TrendingCard(
                    imageAsset: NImages.posters[i],
                    rank: '${i + 1}',
                    width: cardW,
                    height: cardH,
                  ),
                ),
              ),
              if (!isMobile && _canScrollLeft)
                Positioned(
                  left: 0,
                  child: _CarouselArrow(
                    icon: Icons.chevron_left,
                    onTap: () => _scroll(-cardW * 3),
                  ),
                ),
              if (!isMobile && _canScrollRight)
                Positioned(
                  right: 0,
                  child: _CarouselArrow(
                    icon: Icons.chevron_right,
                    onTap: () => _scroll(cardW * 3),
                  ),
                ),
            ],
          ),
          if (isMobile) ...[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.swipe, color: NColor.grey, size: 14),
                const SizedBox(width: 6),
                Text(
                  'Desliza para ver más',
                  style: NFont.body(size: 11, color: NColor.grey),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _CarouselArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CarouselArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 72,
        decoration: BoxDecoration(
          color: NColor.darkGrey.withOpacity(0.85),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: NColor.white, size: 28),
      ),
    );
  }
}

// ─── NÚMERO CON BORDE BLANCO (fix principal) ──────────────────────────────────
class _StrokedRank extends StatelessWidget {
  final String rank;
  final double fontSize;
  const _StrokedRank({required this.rank, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final baseStyle = GoogleFonts.oswald(
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      height: 1,
    );
    return Stack(
      children: [
        // Capa 1 — stroke blanco grueso
        Text(
          rank,
          style: baseStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth =
                  fontSize *
                  0.07 // 7% del tamaño = borde visible
              ..strokeJoin = StrokeJoin.round
              ..color = Colors.white,
          ),
        ),
        // Capa 2 — relleno negro encima
        Text(rank, style: baseStyle.copyWith(color: NColor.dark)),
      ],
    );
  }
}

// ─── TRENDING CARD ────────────────────────────────────────────────────────────
class _TrendingCard extends StatelessWidget {
  final String imageAsset;
  final String rank;
  final double width;
  final double height;
  const _TrendingCard({
    required this.imageAsset,
    required this.rank,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final numFontSize = height * 0.85;
    final numVisualW = numFontSize * 0.58 * rank.length.clamp(1, 2);
    final overlap = numVisualW * 0.40;
    final totalW = numVisualW + width - overlap;

    return SizedBox(
      width: totalW,
      height: height,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomLeft,
        children: [
          // ── NÚMERO con borde blanco ──────────────────────────────────────
          Positioned(
            left: 0,
            bottom: -8,
            child: _StrokedRank(rank: rank, fontSize: numFontSize),
          ),
          // ── POSTER ───────────────────────────────────────────────────────
          Positioned(
            right: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imageAsset,
                width: width,
                height: height,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: width,
                  height: height,
                  color: NColor.darkGrey,
                ),
              ),
            ),
          ),
          // ── Badge N rojo ─────────────────────────────────────────────────
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: NColor.red,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text('N', style: NFont.button(size: 11)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── FEATURES ─────────────────────────────────────────────────────────────────
class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  static const List<Map<String, dynamic>> features = [
    {
      'title': 'Disfruta en tu TV',
      'desc':
          'Ve en smart TV, PlayStation, Xbox, Chromecast, Apple TV, reproductores de Blu-ray y más.',
      'icon': Icons.tv,
      'img': NImages.featureTV,
    },
    {
      'title': 'Descarga para ver offline',
      'desc': 'Guarda tu contenido favorito y siempre tendrás algo para ver.',
      'icon': Icons.download_rounded,
      'img': NImages.featureDownload,
    },
    {
      'title': 'Disfruta donde quieras',
      'desc':
          'Películas y series ilimitadas en tu teléfono, tablet, laptop y TV.',
      'icon': Icons.devices,
      'img': NImages.featureDevices,
    },
    {
      'title': 'Crea perfiles para niños',
      'desc':
          'Los niños vivirán aventuras con sus personajes favoritos en un espacio diseñado para ellos.',
      'icon': Icons.child_care,
      'img': NImages.featureKids,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: NColor.black,
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: isMobile ? 16 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Más motivos para unirte',
              style: NFont.sectionTitle(size: isMobile ? 18 : 22),
            ),
          ),
          ...features.map((f) => _FeatureCard(feature: f, isMobile: isMobile)),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final Map<String, dynamic> feature;
  final bool isMobile;
  const _FeatureCard({required this.feature, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: NColor.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NColor.darkGrey.withOpacity(0.5)),
      ),
      clipBehavior: Clip.antiAlias,
      child: isMobile ? _mobile() : _desktop(),
    );
  }

  Widget _mobile() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 150,
        width: double.infinity,
        child: Image.asset(
          feature['img'] as String,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: NColor.darkGrey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(feature['icon'] as IconData, color: NColor.red, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    feature['title'] as String,
                    style: NFont.sectionTitle(size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(feature['desc'] as String, style: NFont.body(size: 13)),
          ],
        ),
      ),
    ],
  );

  Widget _desktop() => Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    feature['icon'] as IconData,
                    color: NColor.red,
                    size: 26,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    feature['title'] as String,
                    style: NFont.sectionTitle(size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(feature['desc'] as String, style: NFont.body(size: 15)),
            ],
          ),
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        child: Image.asset(
          feature['img'] as String,
          width: 220,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
              Container(width: 220, height: 150, color: NColor.darkGrey),
        ),
      ),
    ],
  );
}

// ─── FAQ ──────────────────────────────────────────────────────────────────────
class _FaqSection extends StatelessWidget {
  const _FaqSection();

  static const List<Map<String, String>> faqs = [
    {
      'q': '¿Qué es Netflix?',
      'a':
          'Netflix es un servicio de streaming que ofrece series, películas, documentales y más en miles de dispositivos conectados a Internet.',
    },
    {
      'q': '¿Cuánto cuesta Netflix?',
      'a':
          'Los planes van desde S/ 28.90 al mes. Sin contratos ni compromisos. Cancela cuando quieras.',
    },
    {
      'q': '¿Dónde puedo ver Netflix?',
      'a':
          'Ve donde quieras: computadora, smartphone, tablet, Smart TV o cualquier dispositivo con Internet.',
    },
    {
      'q': '¿Cómo cancelo?',
      'a':
          'Cancela tu cuenta fácilmente en línea en dos clics. Sin contratos molestos ni cargos adicionales.',
    },
    {
      'q': '¿Qué puedo ver en Netflix?',
      'a':
          'Películas, documentales, series, anime, originales de Netflix galardonados y mucho más.',
    },
    {
      'q': '¿Es bueno Netflix para niños?',
      'a':
          'Sí, la experiencia Netflix para niños está incluida con tu membresía: un perfil fácil de navegar con contenido apto para su edad.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: NColor.black,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: isMobile ? 16 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preguntas frecuentes',
            style: NFont.sectionTitle(size: isMobile ? 18 : 22),
          ),
          const SizedBox(height: 16),
          ...faqs.map((f) => _FaqItem(q: f['q']!, a: f['a']!)),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String q, a;
  const _FaqItem({required this.q, required this.a});
  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: NColor.darkGrey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _open = !_open),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.q,
                      style: NFont.body(size: 15, color: NColor.white),
                    ),
                  ),
                  Icon(
                    _open ? Icons.close : Icons.add,
                    color: NColor.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          if (_open)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: NColor.black, width: 2)),
              ),
              child: Text(
                widget.a,
                style: NFont.body(size: 14, color: NColor.white),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── FOOTER CTA ───────────────────────────────────────────────────────────────
class _FooterCta extends StatelessWidget {
  final TextEditingController emailController;
  const _FooterCta({required this.emailController});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: NColor.black,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: isMobile ? 16 : 80,
      ),
      child: Column(
        children: [
          Text(
            '¿Quieres ver Netflix ya? Ingresa tu email para crear una cuenta o reiniciar tu membresía.',
            textAlign: TextAlign.center,
            style: NFont.body(size: isMobile ? 14 : 17, color: NColor.white),
          ),
          const SizedBox(height: 20),
          _EmailRow(controller: emailController, isMobile: isMobile),
        ],
      ),
    );
  }
}

// ─── FOOTER ───────────────────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  const _Footer();

  static const List<String> links = [
    'Preguntas frecuentes',
    'Centro de ayuda',
    'Cuenta',
    'Prensa',
    'Relaciones con inversionistas',
    'Empleo',
    'Canjear tarjetas de regalo',
    'Comprar tarjetas de regalo',
    'Formas de ver',
    'Términos de uso',
    'Privacidad',
    'Preferencias de cookies',
    'Información corporativa',
    'Contáctanos',
    'Prueba de velocidad',
    'Avisos legales',
    'Solo en Netflix',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: NColor.black,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 16 : 40,
        0,
        isMobile ? 16 : 40,
        40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: NColor.darkGrey),
          const SizedBox(height: 20),
          Text(
            '¿Preguntas? Llama al 0 800 55821',
            style: NFont.body(size: 14, color: NColor.grey),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: links
                .map(
                  (l) => SizedBox(
                    width: isMobile
                        ? (MediaQuery.of(context).size.width - 48) / 2
                        : 180,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        l,
                        style: GoogleFonts.lato(
                          color: NColor.grey,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          decorationColor: NColor.grey,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: NColor.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.language, color: NColor.grey, size: 15),
                const SizedBox(width: 7),
                Text('Español', style: NFont.nav(size: 13, color: NColor.grey)),
                const SizedBox(width: 5),
                const Icon(Icons.arrow_drop_down, color: NColor.grey, size: 17),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Esta página está protegida por Google reCAPTCHA para comprobar que no eres un robot.',
            style: NFont.body(size: 11),
          ),
        ],
      ),
    );
  }
}
