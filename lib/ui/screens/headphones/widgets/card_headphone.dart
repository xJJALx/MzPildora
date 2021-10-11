import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/domain/providers/providers.dart';
import 'package:mz_pildora/data/models/models.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHeadphone extends StatelessWidget {
  CardHeadphone({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        productsProvider.productTitle = this.product.title!;
        productsProvider.assetImage = this.product.image!;
        productsProvider.productPrice = this.product.price!;
        productsProvider.color = this.product.color;
        productsProvider.cartProduct = false;
        productsProvider.producto = this.product;
        Navigator.pushNamed(context, 'details', arguments: product);
      },
      child: Container(
        margin: EdgeInsets.only(left: 30, bottom: 20),
        height: 320,
        width: 280,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            _CardBackground(this.product.color),
            this.product.title!.contains('Black') ? _Title(product.title!, true) : _Title(product.title!),
            this.product.title!.contains('Black') ? _Price(product.price!, true) : _Price(product.price!),
            _Image(product.image!),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  _Title(this.title, [this.contrast = false]);

  final String title;
  final bool contrast;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 15,
      child: Text(
        this.title,
        style: GoogleFonts.karla(
          textStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: contrast ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  _Price(this.price, [this.contrast = false]);

  final String price;
  final bool contrast;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      left: 15,
      child: Text(
        this.price + ' €',
        style: GoogleFonts.montserratAlternates(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: this.contrast ? Colors.white : Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

// NOTA: Hero animation usa como ID el String de la imagen ya que cada imagen es unica.
class _Image extends StatelessWidget {
  _Image(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 30,
      child: Container(
        height: 220,
        width: 200,
        child: SlideInDown(
          from: 100,
          delay: Duration(milliseconds: 200),
          child: Hero(
            tag: this.image,
            child: Transform.rotate(
              angle: 3.14 / 10.0,
              child: Image.asset(this.image),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  _CardBackground(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.color.toString() + 'BG',
      child: Container(
        height: 280,
        width: 240,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: this.color.withOpacity(1),
              blurRadius: 30,
              spreadRadius: -30,
              offset: Offset(0, 32),
            ),
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
      ),
    );
  }
}
