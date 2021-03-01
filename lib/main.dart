import 'package:flutter/material.dart';
import 'package:inheritedwidgetapp/shopping_cart.dart';
import 'pages/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingCart(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
