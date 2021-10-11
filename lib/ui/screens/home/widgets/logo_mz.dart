import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LogoMz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: SlideInDown(
        from: 200,
        duration: Duration(milliseconds: 1200),
        child: Container(
          width: 200,
          height: 220,
          child: Image.asset(
            'assets/img/Mercanza.png',
          ),
        ),
      ),
    );
  }
}

class _LogoMercanza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MercanzaPainter(),
      ),
    );
  }
}

class _MercanzaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    final lapiz2 = new Paint();

    // Propiedades
    lapiz.color = Color(0xff9ACD32);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 10;

    lapiz2.color = Color(0xff6B8E23);
    lapiz2.style = PaintingStyle.fill; // .fill .stroke
    lapiz2.strokeWidth = 10;

    final path = new Path();
    final path2 = new Path();

    var pw1 = size.width * 0.4;
    var ph1 = size.height * 0.1;

    var pw2 = size.width * 0.12;
    var ph2 = size.height * 0.14;

    var pw3 = size.width * 0.11;
    var ph3 = size.height * 0.30;

    var pw4 = size.width * 0.42;
    var ph4 = size.height * 0.35;

    var pw5 = size.width * 0.88;
    var ph5 = size.height * 0.16;

    var pw6 = size.width * 0.90;
    var ph6 = size.height * 0.28;

    // Dibujar con el path y el lapiz
    path.moveTo(size.width * 0.4, 0);
    path.moveTo(pw1, ph1);
    path.lineTo(pw2, ph2);
    path.lineTo(pw3, ph3);
    path.lineTo(pw4, ph4);
    path.lineTo(pw1, ph1);

    path2.moveTo(size.width * 0.4, 0);
    path2.moveTo(pw1, ph1);
    path2.lineTo(pw5, ph5);
    path2.lineTo(pw6, ph6);
    path2.lineTo(pw4, ph4);

    canvas.drawPath(path, lapiz);
    canvas.drawPath(path2, lapiz2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
