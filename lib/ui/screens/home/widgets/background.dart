import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _BackgroundPainter(),
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    final lapiz2 = new Paint();

    // Propiedades
    lapiz.color = Color(0xff6B8E23);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    lapiz2.color = Color(0xff9ACD32).withOpacity(0.8);
    lapiz2.style = PaintingStyle.fill; // .fill .stroke
    lapiz2.strokeWidth = 20;

    final path = new Path();
    final path2 = new Path();

    // Fondo primario
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Fondo secundario
    path2.lineTo(0, size.height * 0.25);
    path2.quadraticBezierTo(size.width * 0.25, size.height * 0.33, size.width * 0.5, size.height * 0.25);
    path2.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.32);
    path2.lineTo(size.width, 0);

    canvas.drawPath(path2, lapiz2);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
