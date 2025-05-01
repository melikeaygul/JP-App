import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Rosa Bereich oben
    final Paint paintPink = Paint()
      ..color = const Color.fromARGB(255, 186, 112, 151).withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final Path pathPink = Path();
    pathPink.moveTo(0, size.height * 0.07); // Startpunkt links oben (hoch)

    // Wellenform nach rechts unten
    pathPink.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.05,
      size.width * 0.42,
      size.height * 0.30,
    );
    pathPink.quadraticBezierTo(
      size.width * 1.5,
      size.height * 0.35,
      size.width * 0.3,
      size.height * 0.5,
    );
    pathPink.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.2,
      size.width,
      size.height * 0.25,
    );

    pathPink.lineTo(size.width, 0);
    pathPink.lineTo(0, 0);
    pathPink.close();

    canvas.drawPath(pathPink, paintPink);

    // Brauner Bereich unten
    final Paint paintBrown = Paint()
      ..color = const Color.fromARGB(255, 32, 20, 18)
      ..style = PaintingStyle.fill;

    final Path pathBrown = Path();
    pathBrown.moveTo(0, size.height * 0.07); // Muss an rosa-Ende anschließen
    // pathBrown.quadraticBezierTo(
    //   size.width * 0.25,
    //   size.height * 0.05,
    //   size.width * 0.42,
    //   size.height * 0.30,
    // );
    // pathBrown.quadraticBezierTo(
    //   size.width * 1.5,
    //   size.height * 0.35,
    //   size.width * 0.3,
    //   size.height * 0.5,
    // );
    pathBrown.cubicTo(
      size.width * 0.2,
      size.height * 0.2,
      size.width * 0.4,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 1.5,
    );

    pathBrown.lineTo(size.width, size.height); // nach unten
    pathBrown.lineTo(0, size.height); // nach links unten
    pathBrown.close();

    canvas.drawPath(pathBrown, paintBrown);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
