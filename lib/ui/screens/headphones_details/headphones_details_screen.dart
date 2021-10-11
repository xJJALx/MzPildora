import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/ui/screens/headphones_details/widgets/details_header.dart';
import 'package:mz_pildora/ui/screens/headphones_details/widgets/details_body.dart';

import 'package:mz_pildora/data/models/models.dart';
import 'package:mz_pildora/domain/providers/providers.dart';

class HeadphonesDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final productsProvider = Provider.of<ProductsProvider>(context);
    final size = MediaQuery.of(context).size;

    // productsProvider.producto = product;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: DetailsHeader(product: product),
            ),
            DetailsBody(),
            SizedBox(height: 60), // Ampliación scroll para dispositivos pequeños
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            productsProvider.cartProduct = true;
            productsProvider.cartNum++;
            productsProvider.addProductToCart(productsProvider.producto);
            Navigator.pop(context);
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: size.width * 0.3),
              Text('Add to Cart'),
              SizedBox(width: size.width * 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
