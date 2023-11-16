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

  // Dummy list of items for demonstration
  List<Item> itemList = [
    Item(
      name: 'Hay Composting Materials',
      price: 15.99,
      rating: 4.5,
      image: 'images/HayCompost.jpg',
    ),
    Item(
      name: 'Garden Compost',
      price: 20.49,
      rating: 4.2,
      image: 'images/GardenCompost.jpg',
    ),
    Item(
      name: 'Cow Manure Compost',
      price: 12.99,
      rating: 4.8,
      image: 'images/CowManure.jpg',
    ),
  ];

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
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  itemList[index].image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text('Price: \$${itemList[index].price}'),
                Text('Rating: ${itemList[index].rating} stars'),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                addToCart(itemList[index].name);
              },
              child: Text('Add to Cart'),
            ),
          );
        },
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

class Item {
  final String name;
  final double price;
  final double rating;
  final String image;

  Item({required this.name, required this.price, required this.rating, required this.image});
}