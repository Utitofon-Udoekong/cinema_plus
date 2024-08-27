import 'package:flutter/material.dart';

class CustomArcPainter extends CustomPainter {
  final Color arcColor;
  final Color shadowColor;
  final double shadowRadius;

  CustomArcPainter({
    super.repaint,
    required this.arcColor,
    required this.shadowColor,
    this.shadowRadius = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    
    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = arcColor;

    // Create the elliptical gradient path
    final shadowPath = Path();
    shadowPath.moveTo(-10, size.height);
    shadowPath.lineTo(0, size.height * 0.5);
    shadowPath.quadraticBezierTo(
        size.width / 4, size.height * 0.2, size.width / 2, size.height * 0.2);
    shadowPath.quadraticBezierTo(
        size.width - (size.width / 4), size.height * 0.2, size.width, size.height * 0.5);
    shadowPath.lineTo(size.width, size.height * 0.5);
    shadowPath.lineTo(size.width + 10, size.height);

    
    
    // Create a paint for the elliptical gradient
    final shadowPaint = Paint()
      ..shader = LinearGradient(
        colors: [shadowColor.withOpacity(0.3), shadowColor.withOpacity(0.01)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(shadowPath.getBounds());

    // Draw the elliptical gradient
    canvas.drawPath(shadowPath, shadowPaint);

    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.2, size.width / 2, size.height * 0.2);
    path.quadraticBezierTo(
        size.width - (size.width / 4), size.height * 0.2, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.5);

    // Draw the arc
    canvas.drawPath(path, arcPaint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomArcClipper extends CustomClipper<Path> {
  final Color gradientStartColor;
  final Color gradientEndColor;
  final Color shadowColor;

  CustomArcClipper({super.reclip, required this.gradientStartColor, required this.gradientEndColor, required this.shadowColor});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 4, size.height - 30, size.width / 2, size.height - 30);
    path.quadraticBezierTo(
      size.width - (size.width / 4), size.height - 30, size.width, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; 

  }
}