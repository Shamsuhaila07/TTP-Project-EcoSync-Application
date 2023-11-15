import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_device.dart';
import 'login_screen.dart';
import 'Dashboard.dart';
import 'shopping_cart.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  final GlobalKey<ScaffoldState> _scaffoldKey3 = GlobalKey<ScaffoldState>();

  List<String> itemsInCart = [];

  void addToCart(String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$item added to the cart'),
        duration: Duration(seconds: 2),
      ),
    );
    setState(() {
      itemsInCart.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey3,
      appBar: AppBar(
        title: const Text("Shopping Screen"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            if (_scaffoldKey3.currentState != null) {
              _scaffoldKey3.currentState!.openDrawer();
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Open the shopping cart screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShoppingCart(itemsInCart),
                  ),
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.green[500],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to the Shopping screen"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addToCart("Item 1"); // Add your item details here
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[50],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[500],
              ),
              child: const Text(
                "Navigation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("HomeScreen"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.device_hub),
              title: const Text("Add Device"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDevice()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                _scaffoldKey3.currentState?.openEndDrawer();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("You are logging out"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Perform logout actions here if needed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

