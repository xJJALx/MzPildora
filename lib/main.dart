import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mz_pildora/domain/providers/providers.dart';
import 'package:mz_pildora/ui/screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mz Píldora Introducción a Flutter',
      home: HeadphonesScreen(),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'headphones': (_) => HeadphonesScreen(),
        'details': (_) => HeadphonesDetailsScreen(),
        'extra': (_) => ExtraScreen(),
      },
    );
  }
}
