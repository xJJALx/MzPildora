import 'package:flutter/material.dart';
import 'package:mz_pildora/data/models/models.dart';

List<Category> categorias = [
  Category(title: "Frutas", image: "assets/ico/cherry.png"),
  Category(title: "Donuts", image: "assets/ico/donut.png"),
  Category(title: "Otros", image: "assets/ico/otro.png"),
];

List<Product> headphones = [
  Product(title: "Mint Green", price: '299', image: "assets/img/airGREEN.png", color: Color(0xff8fbf92).withOpacity(0.8)),
  Product(title: "Berry Pink", price: '299', image: "assets/img/airRED.png", color: Color(0xffef3a33).withOpacity(0.8)),
  Product(title: "Sky Blue", price: '299', image: "assets/img/airBLUE.png", color: Color(0xff2f85aa).withOpacity(0.8)),
  Product(title: "Dazzling Silver", price: '249', image: "assets/img/airSILVER.png", color: Color(0xffe5e5e5).withOpacity(0.8)),
  Product(title: "Night Black", price: '249', image: "assets/img/airBLACK.png", color: Color(0xff161819).withOpacity(0.8)),
];

List<Product> otherModels = [
  Product(title: "AirPods PRO", price: '99', image: "assets/img/airpodsPRO.png", color: Color(0xff161819).withOpacity(0.8)),
  Product(title: "Airpods Active", price: '149', image: "assets/img/airpodsACTIVE.png", color: Color(0xff161819).withOpacity(0.4)),
  Product(title: "Air Beats", price: '179', image: "assets/img/beats.png", color: Color(0xffef3a33).withOpacity(0.8)),
  Product(title: "Sound Core", price: '79', image: "assets/img/soundcore.png", color: Color(0xff2f85aa).withOpacity(0.8)),
  Product(title: "MIVI", price: '99.95', image: "assets/img/mivi.png", color: Color(0xff2f85aa).withOpacity(0.8)),
];
