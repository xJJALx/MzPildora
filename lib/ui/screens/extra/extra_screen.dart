import 'package:flutter/material.dart';
import 'package:mz_pildora/data/models/models.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: Color(0xffebebff),
      appBar: AppBar(backgroundColor: Color(0xffc7b4ff)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            product.title!,
            style: GoogleFonts.karla(
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _ImgProduct(product.image!),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _ImgProduct extends StatelessWidget {
  _ImgProduct(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInUp(
        child: Container(
          width: 230,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: Color(0xffffe7f9), blurRadius: 100),
            ],
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
