import 'package:flutter/material.dart';
import 'package:mz_pildora/data/models/models.dart';

class ProductsProvider extends ChangeNotifier {
  String _assetImage = 'assets/img/airSILVER.png';
  String _productTitle = 'AIR';
  String _productPrice = '0';
  String _selectedCategory = 'All';
  Color _color = Colors.white;
  bool _cartProduct = false;
  int _cartNum = 0;

  late Product _producto;
  List<Product> cart = [];

  Product get producto => this._producto;

  String get assetImage => this._assetImage;

  String get productTitle => this._productTitle;

  String get productPrice => this._productPrice;

  bool get cartProduct => this._cartProduct;

  String get selectedCategory => this._selectedCategory;

  Color get color => this._color;

  int get cartNum => this._cartNum;

  void addProductToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  set producto(Product valor) {
    this._producto = valor;
    notifyListeners();
  }

  set assetImage(String valor) {
    this._assetImage = valor;
    notifyListeners();
  }

  set productTitle(String valor) {
    this._productTitle = valor;
    notifyListeners();
  }

  set productPrice(String valor) {
    this._productPrice = valor;
    notifyListeners();
  }

  set cartProduct(bool valor) {
    this._cartProduct = valor;
    notifyListeners();
  }

  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    notifyListeners();
  }

  set color(Color valor) {
    this._color = valor;
    notifyListeners();
  }

  set cartNum(int valor) {
    this._cartNum = valor;
    notifyListeners();
  }
}
