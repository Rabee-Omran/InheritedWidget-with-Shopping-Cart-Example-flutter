import 'package:flutter/material.dart';

import '../shopping_cart.dart';

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingCart shoppingCart = ShoppingCart.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Details"),
        ),
        body: Center(
          child: Text("${shoppingCart.products.length} Selected",
              style: Theme.of(context).textTheme.headline3),
        ));
  }
}
