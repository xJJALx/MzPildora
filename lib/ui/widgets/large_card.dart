import 'package:flutter/material.dart';

import 'package:mz_pildora/data/models/models.dart';

class LargeCard extends StatelessWidget {
  LargeCard(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 20, left: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: -6, blurRadius: 8),
        ],
      ),
      child: _Product(this.product),
    );
  }
}

class _Product extends StatelessWidget {
  _Product(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'extra', arguments: this.product),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ImgProduct(product.image!),
            _InfoProduct(this.product),
          ],
        ),
      ),
    );
  }
}

class _ImgProduct extends StatelessWidget {
  _ImgProduct(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: double.infinity,
      child: Image.asset(this.image),
    );
  }
}

class _InfoProduct extends StatelessWidget {
  _InfoProduct(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.product.title!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          this.product.title!,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black45,
          ),
        ),
        Text(
          this.product.price! + ' €',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
