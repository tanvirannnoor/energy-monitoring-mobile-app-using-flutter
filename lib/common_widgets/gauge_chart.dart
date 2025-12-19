import 'package:flutter/material.dart';
import 'dart:math' as math;

class GaugeChart extends StatelessWidget {
  final double value;
  final double maxValue;
  final String unit;
  final String label;
  final bool isHalfCircle;

  const GaugeChart({
    super.key,
    required this.value,
    required this.maxValue,
    required this.unit,
    required this.label,
    this.isHalfCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: isHalfCircle ? 120 : 180,
          width: 180,
          child: CustomPaint(
            painter: GaugePainter(
              value: value,
              maxValue: maxValue,
              isHalfCircle: isHalfCircle,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: isHalfCircle ? 40 : 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value < 1000 ? value.toStringAsFixed(2) : value.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

class GaugePainter extends CustomPainter {
  final double value;
  final double maxValue;
  final bool isHalfCircle;

  GaugePainter({
    required this.value,
    required this.maxValue,
    this.isHalfCircle = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 10;
    final sweepAngle = isHalfCircle ? math.pi : 2 * math.pi;
    final startAngle = isHalfCircle ? math.pi : -math.pi / 2;

    final bgPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      bgPaint,
    );

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF1E88E5), Color(0xFF64B5F6)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final progressAngle = (value / maxValue) * sweepAngle;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}