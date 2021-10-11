import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideInLeft(
        from: 100,
        duration: Duration(milliseconds: 1200),
        child: Column(
          children: [
            Text(
              'Mz Píldora',
              style: GoogleFonts.karla(
                fontSize: 30,
                color: Color(0xff9ACD32),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Introducción a Flutter',
              style: GoogleFonts.karla(
                fontSize: 24,
                color: Color(0xff6B8E23),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 60,
              height: 60,
              child: Flash(
                delay: Duration(milliseconds: 1200),
                child: FlutterLogo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
