import 'package:flutter/material.dart';

void main() => runApp(const BankingDashboardApp());

class BankingDashboardApp extends StatelessWidget {
  const BankingDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking • Card Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEAF1F6),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const CardDashboardScreen(),
    );
  }
}

class CardDashboardScreen extends StatefulWidget {
  const CardDashboardScreen({super.key});

  @override
  State<CardDashboardScreen> createState() => _CardDashboardScreenState();
}

class _CardDashboardScreenState extends State<CardDashboardScreen> {
  int _selectedNavIndex = 0;

  static const List<Map<String, String>> _recipients = [
    {'name': 'Darlene Alde...', 'img': 'https://i.pravatar.cc/150?img=47'},
    {'name': 'Elliot Alderson', 'img': 'https://i.pravatar.cc/150?img=12'},
    {'name': 'Leon', 'img': 'https://i.pravatar.cc/150?img=68'},
    {'name': 'Square Planet', 'img': 'https://i.pravatar.cc/150?img=33'},
    {'name': 'Square Planet', 'img': 'https://i.pravatar.cc/150?img=33'},
  ];

  static const List<String> _navLabels = [
    'Home',
    'Transfers',
    'Cards',
    'Stocks',
    'Offers',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F6),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    _buildStatusAndGreeting(),
                    const SizedBox(height: 18),
                    _buildPaymentCards(),
                    const SizedBox(height: 18),
                    _buildRecipientsAndActions(),
                    const SizedBox(height: 26),
                    _buildRecentTransactions(),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  // 1. STATUS AND GREETING
  Widget _buildStatusAndGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFD0DFE7),
                  image: DecorationImage(
                    image: const NetworkImage(
                      'https://i.pravatar.cc/150?img=11',
                    ),
                    fit: BoxFit.cover,
                    onError: (_, __) {},
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFF5B400),
                    size: 22,
                  ),
                  const SizedBox(width: 26),
                  _svgIcon(_IconType.bell, 20),
                  const SizedBox(width: 24),
                  _svgIcon(_IconType.settings, 20),
                  const SizedBox(width: 12),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Hello Michael 👋',
            style: TextStyle(
              color: Color(0xFF1D2021),
              fontSize: 26,
              fontWeight: FontWeight.w500,
              height: 31 / 26,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text(
                '3 new transactions ',
                style: TextStyle(
                  color: Color(0xFF758191),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 16 / 13,
                ),
              ),
              Text(
                'since last visit.',
                style: TextStyle(
                  color: Color(0xFF758191),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 16 / 13,
                ),
              ),
              SizedBox(width: 6),
              Text(
                '2 hours ago',
                style: TextStyle(
                  color: Color(0xFF758191),
                  fontSize: 7.5,
                  fontWeight: FontWeight.w700,
                  height: 9 / 7.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. PAYMENT CARDS (FULL-WIDTH RESPONSIVE CAROUSEL)
  Widget _buildPaymentCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double primaryWidth = (constraints.maxWidth * 0.74).clamp(
          289.0,
          480.0,
        );
        final double secondaryWidth = (constraints.maxWidth * 0.58).clamp(
          225.0,
          360.0,
        );

        return SizedBox(
          height: 185,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            children: [
              Container(
                width: primaryWidth,
                height: 181,
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.fromLTRB(23, 20, 20, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6887FF), Color(0xFF3D41C9)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3838BF).withValues(alpha: 0.28),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Michael Squarehead',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 14 / 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '**** **** **** 3732',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        height: 18 / 15,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Account Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                height: 11 / 9,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$25,487.59',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'monospace',
                                fontWeight: FontWeight.w500,
                                height: 22 / 18,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'VISA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            height: 29 / 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: secondaryWidth,
                height: 181,
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFD0DFE7),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xFFB3C4CF),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _svgIcon(_IconType.plus, 19),
                    const SizedBox(height: 6),
                    const Text(
                      'Add new account',
                      style: TextStyle(
                        color: Color(0xFF758191),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 22 / 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tap here to add another\naccount now. All protected.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF758191),
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        height: 11 / 9,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 3. RECIPIENTS AND PAYMENT ACTIONS
  Widget _buildRecipientsAndActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            children: _recipients.map((item) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 86,
                          maxHeight: 86,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFD0DFE7),
                              image: DecorationImage(
                                image: NetworkImage(item['img']!),
                                fit: BoxFit.cover,
                                onError: (_, __) {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF1D2021),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 16 / 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 17),
          Container(
            width: double.infinity,
            height: 57,
            padding: const EdgeInsets.only(left: 6, right: 9),
            decoration: BoxDecoration(
              color: const Color(0xFFD0DFE7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 150,
                  child: _actionPillButton('Send Payment', _IconType.arrowUp),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: 166,
                  child: _actionPillButton(
                    'Receive Payment',
                    _IconType.arrowDown,
                  ),
                ),
                const SizedBox(width: 4),
                _svgIcon(_IconType.dots, 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionPillButton(String label, _IconType iconType) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _svgIcon(iconType, 21),
          const SizedBox(width: 9),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF758191),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 16 / 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. RECENT TRANSACTIONS
  Widget _buildRecentTransactions() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(
                          color: Color(0xFF1D2021),
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          height: 23 / 19,
                        ),
                      ),
                      const SizedBox(width: 6),
                      _svgIcon(
                        _IconType.arrowRight,
                        20,
                        color: const Color(0xFF1D2021),
                      ),
                    ],
                  ),
                  const Text(
                    'Access All',
                    style: TextStyle(
                      color: Color(0xFF758191),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 16 / 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _transactionTile(
                'Square planet',
                'Pro plan Complete',
                '\$265.00',
                '09.01.2024',
                const Color(0xFF3D41C9),
                Icons.public_rounded,
                true,
              ),
              _transactionTile(
                'Spotify',
                'Card Payment',
                '\$10.99',
                '08.01.2024',
                const Color(0xFF1DB954),
                Icons.graphic_eq_rounded,
                true,
              ),
              _transactionTile(
                'Apple',
                'Card Payment',
                '\$3499.00',
                '08.01.2024',
                const Color(0xFF1D2021),
                Icons.apple_rounded,
                false,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 73,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFEAF1F6).withValues(alpha: 0.0),
                    const Color(0xFFEAF1F6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _transactionTile(
    String title,
    String subtitle,
    String amount,
    String date,
    Color bg,
    IconData icon,
    bool divider,
  ) {
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF1D2021),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 18 / 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF758191),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 13 / 11,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Color(0xFF1D2021),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 17 / 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFF758191),
                      fontSize: 9.5,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w400,
                      height: 11 / 9.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          if (divider)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xFFBECBD5),
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // 5. BOTTOM NAVIGATION
  Widget _buildBottomNavigation() {
    const List<_IconType> navIcons = [
      _IconType.navHome,
      _IconType.navTransfers,
      _IconType.navCards,
      _IconType.navStocks,
      _IconType.navOffers,
    ];

    return Container(
      width: double.infinity,
      height: 87,
      color: const Color(0xFFEAF1F6),
      child: Column(
        children: [
          const SizedBox(height: 9),
          Row(
            children: List.generate(_navLabels.length, (i) {
              final bool selected = _selectedNavIndex == i;
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => _selectedNavIndex = i),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 53,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFF1D2021)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: _svgIcon(
                          navIcons[i],
                          20,
                          color: selected
                              ? const Color(0xFFEAF1F6)
                              : const Color(0xFF1D2021),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _navLabels[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF1D2021),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 14 / 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const Spacer(),
          Container(
            width: 102,
            height: 4,
            margin: const EdgeInsets.only(bottom: 9),
            decoration: BoxDecoration(
              color: const Color(0xFF1D2021),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _svgIcon(
    _IconType type,
    double size, {
    Color color = const Color(0xFF758191),
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _UnifiedSvgPainter(type: type, color: color),
      ),
    );
  }
}

// 6. UNIFIED EXACT SVG PAINTER
enum _IconType {
  bell,
  settings,
  plus,
  arrowUp,
  arrowDown,
  dots,
  arrowRight,
  navHome,
  navTransfers,
  navCards,
  navStocks,
  navOffers,
}

class _UnifiedSvgPainter extends CustomPainter {
  final _IconType type;
  final Color color;

  const _UnifiedSvgPainter({required this.type, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.square;
    final path = Path();

    switch (type) {
      case _IconType.bell:
        path
          ..moveTo(10, 2.5)
          ..cubicTo(12.76, 2.5, 15, 4.74, 15, 7.5)
          ..lineTo(15, 11.67)
          ..lineTo(16.67, 15)
          ..lineTo(3.33, 15)
          ..lineTo(5, 11.67)
          ..lineTo(5, 7.5)
          ..cubicTo(5, 4.74, 7.24, 2.5, 10, 2.5)
          ..close()
          ..moveTo(10, 2.5)
          ..lineTo(10, 0.83)
          ..moveTo(8.33, 18.33)
          ..lineTo(11.67, 18.33);
        break;
      case _IconType.settings:
        path
          ..moveTo(7.5, 1.67)
          ..lineTo(6.67, 4.17)
          ..lineTo(4.17, 3.33)
          ..lineTo(1.67, 7.5)
          ..lineTo(4.17, 9.17)
          ..lineTo(4.17, 11.67)
          ..lineTo(1.67, 13.33)
          ..lineTo(4.17, 17.5)
          ..lineTo(6.67, 16.67)
          ..lineTo(8.33, 18.33)
          ..lineTo(12.5, 18.33)
          ..lineTo(13.33, 15.83)
          ..lineTo(15.83, 16.67)
          ..lineTo(18.33, 12.5)
          ..lineTo(15.83, 10.83)
          ..lineTo(15.83, 8.33)
          ..lineTo(18.33, 6.67)
          ..lineTo(15.83, 2.5)
          ..lineTo(13.33, 3.33)
          ..lineTo(11.67, 1.67)
          ..close();
        canvas.drawCircle(const Offset(10, 10), 3.33, paint);
        break;
      case _IconType.plus:
        path
          ..moveTo(9.5, 3.17)
          ..lineTo(9.5, 15.83)
          ..moveTo(3.17, 9.5)
          ..lineTo(15.83, 9.5);
        break;
      case _IconType.arrowUp:
        path
          ..moveTo(10.5, 18.375)
          ..lineTo(10.5, 3.5)
          ..moveTo(16.625, 9.625)
          ..lineTo(10.5, 3.5)
          ..lineTo(4.375, 9.625);
        break;
      case _IconType.arrowDown:
        path
          ..moveTo(10.5, 2.625)
          ..lineTo(10.5, 17.5)
          ..moveTo(16.625, 11.375)
          ..lineTo(10.5, 17.5)
          ..lineTo(4.375, 11.375);
        break;
      case _IconType.dots:
        final fillPaint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill;
        for (final y in [4.17, 10.0, 15.83]) {
          canvas.drawCircle(Offset(10, y), 0.92, fillPaint);
          canvas.drawCircle(Offset(10, y), 0.92, paint);
        }
        return;
      case _IconType.arrowRight:
        path
          ..moveTo(2.5, 10)
          ..lineTo(16.67, 10)
          ..moveTo(11.67, 15)
          ..lineTo(16.67, 10)
          ..lineTo(11.67, 5);
        break;
      case _IconType.navHome:
        path
          ..moveTo(3.33, 8.33)
          ..lineTo(10, 2.5)
          ..lineTo(16.67, 8.33)
          ..lineTo(16.67, 17.5)
          ..lineTo(11.67, 17.5)
          ..lineTo(11.67, 10.83)
          ..lineTo(8.33, 10.83)
          ..lineTo(8.33, 17.5)
          ..lineTo(3.33, 17.5)
          ..close();
        break;
      case _IconType.navTransfers:
        canvas.drawArc(
          Rect.fromCircle(center: const Offset(10, 10.7), radius: 6.6),
          0.6,
          4.7,
          false,
          paint,
        );
        canvas.drawArc(
          Rect.fromCircle(center: const Offset(9.5, 11.5), radius: 3.5),
          0.7,
          3.5,
          false,
          paint,
        );
        path
          ..moveTo(16.67, 5.83)
          ..lineTo(16.67, 10.83)
          ..lineTo(11.67, 10.83)
          ..moveTo(15.83, 10.83)
          ..lineTo(18.33, 8.33)
          ..lineTo(15.83, 5.83);
        break;
      case _IconType.navCards:
        path
          ..moveTo(17.5, 9.17)
          ..lineTo(17.5, 3.33)
          ..lineTo(1.67, 3.33)
          ..lineTo(1.67, 15)
          ..lineTo(10, 15)
          ..moveTo(1.67, 7.5)
          ..lineTo(17.5, 7.5)
          ..moveTo(14.17, 12.5)
          ..lineTo(14.17, 18.33)
          ..moveTo(10.83, 15.42)
          ..lineTo(17.5, 15.42);
        break;
      case _IconType.navStocks:
        path
          ..moveTo(2.5, 11.67)
          ..lineTo(7.5, 14.17)
          ..lineTo(11.67, 9.17)
          ..lineTo(17.5, 13.33)
          ..moveTo(2.5, 16.67)
          ..lineTo(2.5, 6.67)
          ..lineTo(7.5, 10)
          ..lineTo(11.67, 3.33)
          ..lineTo(17.5, 6.67)
          ..lineTo(17.5, 16.67)
          ..close();
        break;
      case _IconType.navOffers:
        canvas.drawCircle(const Offset(10, 7.5), 5.83, paint);
        path
          ..moveTo(6.67, 12.5)
          ..lineTo(5.83, 19.17)
          ..lineTo(10, 16.67)
          ..lineTo(14.17, 19.17)
          ..lineTo(13.33, 12.5)
          ..moveTo(10, 3.33)
          ..lineTo(11.08, 5.83)
          ..lineTo(13.75, 6.0)
          ..lineTo(11.67, 7.83)
          ..lineTo(12.33, 10.42)
          ..lineTo(10, 9.0)
          ..lineTo(7.67, 10.42)
          ..lineTo(8.33, 7.83)
          ..lineTo(6.25, 6.0)
          ..lineTo(8.92, 5.83)
          ..close();
        break;
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _UnifiedSvgPainter oldDelegate) =>
      oldDelegate.type != type || oldDelegate.color != color;
}
