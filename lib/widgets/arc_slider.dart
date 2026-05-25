import 'dart:math';
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class ArcSlider extends StatelessWidget {
  final double progress;

  const ArcSlider({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: ArcPainter(progress: progress),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress;

  ArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Setup the paints with responsive line weights
    final backgroundTrackPaint = Paint()
      ..color = Colors.black.withOpacity(0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final progressTrackPaint = Paint()
      ..color = AppColors.textPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final thumbPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final thumbBorderPaint = Paint()
      ..color = AppColors.textPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Dynamic Capsule Geometry Calculation
    // The radius of the semi-circle bottom is always exactly half of the container width
    final capsuleRadius = size.width / 2;

    // The center is positioned perfectly at the bottom middle of the container
    final center = Offset(size.width / 2, size.height - capsuleRadius);

    // The slider track floats exactly 14 pixels outside the capsule body
    final sliderRadius = capsuleRadius + 14;

    // Define the Arc Angles
    const startAngle = pi * 0.85;
    const sweepAngle = -pi * 0.70;

    // Draw the background track path
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: sliderRadius),
      startAngle,
      sweepAngle,
      false,
      backgroundTrackPaint,
    );

    // Draw the active progress path
    final currentSweepAngle = sweepAngle * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: sliderRadius),
      startAngle,
      currentSweepAngle,
      false,
      progressTrackPaint,
    );

    // Calculate the responsive thumb handle position
    final thumbAngle = startAngle + currentSweepAngle;
    final thumbX = center.dx + sliderRadius * cos(thumbAngle);
    final thumbY = center.dy + sliderRadius * sin(thumbAngle);
    final thumbPosition = Offset(thumbX, thumbY);

    // Draw the slider knob
    canvas.drawCircle(thumbPosition, 7, thumbPaint);
    canvas.drawCircle(thumbPosition, 7, thumbBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
