import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inheritedwidgetapp/pages/product.dart';
import 'package:badges/badges.dart';
import 'package:inheritedwidgetapp/shopping_cart.dart';
import 'cart_details.dart';

class Home extends StatelessWidget {
  List<Product> items = List.generate(100, (i) {
    return Product("Product $i", Random().nextInt(5000), false);
  });
  @override
  Widget build(BuildContext context) {
    ShoppingCart shoppingCart = ShoppingCart.of(context);
    return StatefulBuilder(
      builder: (
        context,
        setState,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Shopping Card"),
            actions: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 25),
                child: Badge(
                  badgeContent: Text("${shoppingCart.products.length}",
                      style: TextStyle(color: Colors.white)),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => CartDetails(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    subtitle: Text("${items[index].price}"),
                    title: Row(
                      children: [
                        Expanded(child: Text(items[index].name)),
                        Checkbox(
                          value: items[index].isCheck,
                          onChanged: (val) {
                            setState(() {
                              items[index].isCheck = !items[index].isCheck;
                              if (items[index].isCheck) {
                                shoppingCart.products.add(items[index]);
                              } else {
                                shoppingCart.products.remove(items[index]);
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
