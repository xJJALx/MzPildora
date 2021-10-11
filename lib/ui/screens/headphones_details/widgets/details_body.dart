import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/data/lists/data_list.dart';
import 'package:mz_pildora/domain/providers/providers.dart';
import 'package:mz_pildora/ui/screens/headphones_details/widgets/circle_options.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BodyDetails(),
        _ColorOptions(),
        _ExtraProduct(),
      ],
    );
  }
}

class _BodyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomIn(
                child: Text(
                  productsProvider.productTitle,
                  style: GoogleFonts.karla(
                    textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Text(
                productsProvider.productPrice + ' €',
                style: GoogleFonts.karla(
                  textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87),
                ),
              ),
            ],
          ),
          Text(
            'Cillum sint eu ex laboris. Minim anim magna pariatur proident do ex consectetur dolor aliqua anim quis. Tempor commodo magna culpa eiusmod aute id enim nisi id laboris amet.',
            style: GoogleFonts.karla(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100, color: Colors.black45),
            ),
          )
        ],
      ),
    );
  }
}

class _ColorOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: headphones.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => FadeInLeft(child: Center(child: CircleOptions(headphones[index]))),
      ),
    );
  }
}

class _ExtraProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A case with staying power',
            style: GoogleFonts.karla(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/img/mivi.png'),
              ),
              Expanded(
                child: Text(
                  'Aute velit esse labore duis. Pariatur reprehenderit cupidatat deserunt qui Lorem eiusmod qui commodo esse id. Cupidatat aute do duis aliquip dolore incididunt et aute. Consequat aliquip elit et officia eu ea exercitation commodo elit reprehenderit culpa quis consequat consequat.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: GoogleFonts.karla(
                    textStyle: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
