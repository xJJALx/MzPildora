import 'package:flutter/material.dart';

import 'package:mz_pildora/ui/screens/home/widgets/background.dart';
import 'package:mz_pildora/ui/screens/home/widgets/logo_mz.dart';
import 'package:mz_pildora/ui/screens/home/widgets/title_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // body: _LogoMercanza(),

      body: Stack(
        children: [
          Background(),
          Column(
            children: [
              LogoMz(),
              TitleHome(),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, 'headphones'),
        backgroundColor: Color(0xff6B8E23),
        label: Row(
          children: [
            Text(
              ' GO ',
              style: TextStyle(fontSize: 18),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
