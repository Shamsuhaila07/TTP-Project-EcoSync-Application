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

  List<CartItem> itemsInCart = [];

  void addToCart(Item item) {
    // Check if the item is already in the cart
    bool alreadyInCart = false;
    for (CartItem cartItem in itemsInCart) {
      if (cartItem.item.name == item.name) {
        alreadyInCart = true;
        cartItem.quantity++;
        break;
      }
    }

    // If not in cart, add a new item
    if (!alreadyInCart) {
      setState(() {
        itemsInCart.add(CartItem(item: item, quantity: 1));
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to the cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Dummy list of items for demonstration
  List<Item> itemList = [
    Item(
      name: 'Hay Composting Materials 2KG',
      price: 15.99,
      rating: 4.5,
      image: 'images/HayCompost.jpg',
    ),
    Item(
      name: 'Garden Compost 2KG',
      price: 20.49,
      rating: 4.2,
      image: 'images/GardenCompost.jpg',
    ),
    Item(
      name: 'Cow Manure Compost 1KG',
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
            leading: Image.asset(
              itemList[index].image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: \RM${itemList[index].price}'),
                Text('Rating: ${itemList[index].rating} stars'),
                ElevatedButton(
                  onPressed: () {
                    addToCart(itemList[index]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Set button color to green
                  ),
                  child: Text('Add to Cart'),
                ),
              ],
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
                "Welcome \n UserTest101",
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
