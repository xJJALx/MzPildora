import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/data/models/models.dart';
import 'package:mz_pildora/domain/providers/providers.dart';

import 'package:animate_do/animate_do.dart';

class DetailsHeader extends StatelessWidget {
  DetailsHeader({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          _Background(),
          _ProductImg(),
          _Actions(),
        ],
      ),
    );
  }
}

// NOTA: Para evitar el efecto en los fondos de la tarjetas cuando se añade un producto limpiamos el tag
// El fondo del producto es el fondo de las tarjetas
class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return SlideInUp(
      from: 50,
      child: Hero(
        tag: productsProvider.cartProduct ? '' : productsProvider.color.toString() + 'BG',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _BackgroundPainter(productsProvider.color),
          ),
        ),
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  _BackgroundPainter(this.color);
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = this.color;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Baackground
    path.lineTo(0, size.height * 0.78);
    path.quadraticBezierTo(size.width * 0.65, size.height, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _Actions extends StatefulWidget {
  @override
  __HeaderActionsState createState() => __HeaderActionsState();
}

class __HeaderActionsState extends State<_Actions> {
  bool fill = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: Icon(Icons.arrow_back_outlined, color: Colors.white),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                this.fill = !this.fill;
              });
            },
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: fill ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_outline, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// Para controlar a donde debe ir la animación en función de si se añade un producto o se vuelve
// a la pagina anterior detectamos si se ha añadido al carrito ( se controla con una flag que
// detecta que se ha pulsado el boton de 'Add to cart')
// para asignarle un tag con la cantidad de productos del carrito
class _ProductImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<ProductsProvider>(context);
    final cartTag = productsProvider.assetImage + productsProvider.cartNum.toString() + 'cartTag';

    return Hero(
      tag: productsProvider.cartProduct ? cartTag : productsProvider.assetImage,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: size.height * 0.35,
        // height: 200,
        child: Image(
          image: AssetImage(productsProvider.assetImage),
        ),
      ),
    );
  }
}
