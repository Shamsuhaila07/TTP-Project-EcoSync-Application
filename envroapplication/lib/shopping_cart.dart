import 'package:flutter/material.dart';
import 'shopping.dart';

class ShoppingCart extends StatefulWidget {
  final List<CartItem> itemsInCart;

  ShoppingCart(this.itemsInCart);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: Colors.green[500],
      ),
      body: ListView.builder(
        itemCount: widget.itemsInCart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.itemsInCart[index].item.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: RM${widget.itemsInCart[index].item.price}'),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        _decrementQuantity(index);
                      },
                    ),
                    Text('${widget.itemsInCart[index].quantity}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _incrementQuantity(index);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[500],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Place order and clear the cart
              _placeOrder(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green[500], // background color
              onPrimary: Colors.white, // text color
            ),
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }

  void _incrementQuantity(int index) {
    setState(() {
      widget.itemsInCart[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (widget.itemsInCart[index].quantity > 0) {
        widget.itemsInCart[index].quantity--;
      }
    });
  }

  void _placeOrder(BuildContext context) {
    // Perform order placement logic here

    // Clear the cart
    widget.itemsInCart.clear();

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Order Placed"),
          content: Text("Your order has been placed!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the cart screen
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class CartItem {
  final Item item;
  int quantity;

  CartItem({required this.item, required this.quantity});
}
