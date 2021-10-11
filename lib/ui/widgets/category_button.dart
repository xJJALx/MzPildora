import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/domain/providers/providers.dart';

import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  final String category;

  CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return GestureDetector(
      onTap: () => productsProvider.selectedCategory = this.category,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 20),
        decoration: BoxDecoration(
          color: productsProvider.selectedCategory == category ? Colors.black87 : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          this.category,
          style: GoogleFonts.karla(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: productsProvider.selectedCategory == category ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
