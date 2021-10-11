import 'package:flutter/material.dart';

import 'package:mz_pildora/data/lists/data_list.dart';
import 'package:mz_pildora/ui/widgets/widgets.dart';
import 'package:mz_pildora/ui/screens/headphones/widgets/card_headphone.dart';

import 'package:google_fonts/google_fonts.dart';

class HeadphonesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _widthScreen = MediaQuery.of(context).size.width;

    final landscape = Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: _Headphones()),
      bottomSheet: Cart(),
    );

    final portrait = Scaffold(
      body: _Headphones(),
      bottomSheet: Cart(),
    );

    if (_widthScreen > 545) return landscape;

    return portrait;
  }
}

class _Headphones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleAppbar(),
        _MainTitle(),
        _Categories(),
        _SliderMainProducts(),
        _TitleOtherModels(),
        _ListOtherModels(),
      ],
    );
  }
}

class _MainTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, bottom: 20, left: 20),
      child: Row(
        children: [
          Text(
            'New ',
            style: GoogleFonts.karla(
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black87),
            ),
          ),
          Text(
            'Arrivals',
            style: GoogleFonts.karla(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton('All'),
          CategoryButton('Mini'),
          CategoryButton('Pro'),
          CategoryButton('Active'),
          CategoryButton('Max'),
          CategoryButton('Light'),
          CategoryButton('Dark'),
        ],
      ),
    );
  }
}

class _SliderMainProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: headphones.length,
        itemBuilder: (_, index) => Center(child: CardHeadphone(product: headphones[index])),
      ),
    );
  }
}

class _TitleOtherModels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            'OTHER MODELS',
            style: GoogleFonts.karla(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87.withOpacity(0.6),
              ),
            ),
          ),
          Spacer(),
          Text(
            'View All',
            style: GoogleFonts.karla(
              fontSize: 14,
              textStyle: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.black26.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListOtherModels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _widthScreen = MediaQuery.of(context).size.width;

    // Tamaño del Listview fijo (height) para pantalla rotada, sino da error
    if (_widthScreen > 545) {
      return Container(
        height: 160,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: otherModels.length,
          itemBuilder: (_, index) => LargeCard(otherModels[index]),
        ),
      );
    }

    // Tamaño flexible
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: otherModels.length,
        itemBuilder: (_, index) => Center(child: LargeCard(otherModels[index])),
      ),
    );
  }
}
