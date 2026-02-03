import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThreatLocation {
  final double x;
  final double y;
  final String country;
  final int threatCount;
  final Color color;

  ThreatLocation({
    required this.x,
    required this.y,
    required this.country,
    required this.threatCount,
    required this.color,
  });
}

class ThreatMapWidget extends StatefulWidget {
  final List<ThreatLocation> locations;

  const ThreatMapWidget({super.key, required this.locations});

  @override
  State<ThreatMapWidget> createState() => _ThreatMapWidgetState();
}

class _ThreatMapWidgetState extends State<ThreatMapWidget>
    with TickerProviderStateMixin {
  late List<AnimationController> _pulseControllers;
  late List<Animation<double>> _pulseAnimations;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _pulseControllers = List.generate(
      widget.locations.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500 + (index * 200)),
      )..repeat(reverse: true),
    );

    _pulseAnimations = _pulseControllers.map((controller) {
      return Tween<double>(
        begin: 0.8,
        end: 1.2,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _pulseControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Global Threat Map',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  // World map background (simplified)
                  CustomPaint(painter: _WorldMapPainter(), child: Container()),
                  // Threat markers
                  ...widget.locations.asMap().entries.map((entry) {
                    final index = entry.key;
                    final location = entry.value;
                    return Positioned(
                      left: location.x,
                      top: location.y,
                      child: AnimatedBuilder(
                        animation: _pulseAnimations[index],
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _pulseAnimations[index].value,
                            child: _ThreatMarker(
                              color: location.color,
                              country: location.country,
                              count: location.threatCount,
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLegendItem('Critical', const Color(0xFF8B0000)),
        _buildLegendItem('High', AppColors.c_F71E52),
        _buildLegendItem('Medium', AppColors.c_F7931E),
        _buildLegendItem('Low', AppColors.c_03A64B),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}

class _ThreatMarker extends StatelessWidget {
  final Color color;
  final String country;
  final int count;

  const _ThreatMarker({
    required this.color,
    required this.country,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.5),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _WorldMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Simplified world map outlines (continents)
    // North America
    final northAmerica = Path()
      ..moveTo(size.width * 0.15, size.height * 0.25)
      ..quadraticBezierTo(
        size.width * 0.18,
        size.height * 0.3,
        size.width * 0.22,
        size.height * 0.35,
      )
      ..lineTo(size.width * 0.25, size.height * 0.45)
      ..lineTo(size.width * 0.2, size.height * 0.5)
      ..lineTo(size.width * 0.15, size.height * 0.4);
    canvas.drawPath(northAmerica, paint);

    // Europe
    final europe = Path()
      ..moveTo(size.width * 0.45, size.height * 0.25)
      ..lineTo(size.width * 0.5, size.height * 0.3)
      ..lineTo(size.width * 0.48, size.height * 0.35)
      ..lineTo(size.width * 0.43, size.height * 0.3);
    canvas.drawPath(europe, paint);

    // Asia
    final asia = Path()
      ..moveTo(size.width * 0.55, size.height * 0.25)
      ..quadraticBezierTo(
        size.width * 0.65,
        size.height * 0.3,
        size.width * 0.75,
        size.height * 0.35,
      )
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..lineTo(size.width * 0.7, size.height * 0.45)
      ..lineTo(size.width * 0.6, size.height * 0.4);
    canvas.drawPath(asia, paint);

    // Africa
    final africa = Path()
      ..moveTo(size.width * 0.46, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width * 0.52, size.height * 0.65)
      ..lineTo(size.width * 0.48, size.height * 0.7)
      ..lineTo(size.width * 0.44, size.height * 0.6)
      ..lineTo(size.width * 0.42, size.height * 0.45);
    canvas.drawPath(africa, paint);

    // South America
    final southAmerica = Path()
      ..moveTo(size.width * 0.28, size.height * 0.55)
      ..lineTo(size.width * 0.3, size.height * 0.65)
      ..lineTo(size.width * 0.28, size.height * 0.75)
      ..lineTo(size.width * 0.25, size.height * 0.65)
      ..lineTo(size.width * 0.26, size.height * 0.58);
    canvas.drawPath(southAmerica, paint);

    // Australia
    final australia = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width * 0.75, size.height * 0.7),
          width: size.width * 0.1,
          height: size.height * 0.12,
        ),
      );
    canvas.drawPath(australia, paint);
  }

  @override
  bool shouldRepaint(_WorldMapPainter oldDelegate) => false;
}
