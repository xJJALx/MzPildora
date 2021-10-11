import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/domain/providers/providers.dart';
import 'package:mz_pildora/data/models/models.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    if (productsProvider.cart.length == 0) {
      return Container(height: 1, width: 1, color: Colors.red);
    }

    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.95),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(width: 24),
              Text(
                'Cart:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 20),
              _CartList(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Expanded(
      child: Container(
        height: 80,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsProvider.cart.length,
          itemBuilder: (_, index) => Center(
            child: CartProduct(
              product: productsProvider.cart[index],
              index: ++index,
            ),
          ),
        ),
      ),
    );
  }
}

// El tag es dinámico según la cantidad de productos añadidos al carrito
class CartProduct extends StatelessWidget {
  CartProduct({required this.product, required this.index});

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.product.image! + index.toString() + 'cartTag',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: this.product.color.withOpacity(0.6),
          maxRadius: 28,
          child: Image.asset(this.product.image!),
        ),
      ),
    );
  }
}
