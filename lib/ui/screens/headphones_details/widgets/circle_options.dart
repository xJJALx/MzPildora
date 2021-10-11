import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/data/models/models.dart';
import 'package:mz_pildora/domain/providers/providers.dart';

class CircleOptions extends StatelessWidget {
  final Product product;

  CircleOptions(this.product);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return GestureDetector(
      onTap: () {
        productsProvider.productTitle = this.product.title!;
        productsProvider.assetImage = this.product.image!;
        productsProvider.productPrice = this.product.price!;
        productsProvider.color = this.product.color;
        productsProvider.producto = this.product;
        // Navigator.pushNamed(context, 'details', arguments: product);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 30),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: productsProvider.assetImage == this.product.image ? Border.all(width: 2, color: this.product.color) : Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.15),
        ),
        child: Image.asset(this.product.image!),
      ),
    );
  }
}
