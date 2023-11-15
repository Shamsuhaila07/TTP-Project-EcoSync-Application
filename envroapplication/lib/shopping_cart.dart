import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  final List<String> itemsInCart;

  ShoppingCart(this.itemsInCart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: Colors.green[500],
      ),
      body: ListView.builder(
        itemCount: itemsInCart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemsInCart[index]),
          );
        },
      ),
    );
  }
}
