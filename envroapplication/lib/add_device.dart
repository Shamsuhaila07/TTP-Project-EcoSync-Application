import 'package:envroapplication/Dashboard.dart';
import 'package:flutter/material.dart';
import 'shopping.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

class AddDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey2,
      appBar: AppBar(
        title: const Text("Add Device Screen"),
        automaticallyImplyLeading: false, // Disable the back button
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open the drawer when the menu button is pressed
            if (_scaffoldKey2.currentState != null) {
              _scaffoldKey2.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.green[500],
      ),
      body: const Center(
        child: Text("Welcome to the Add Device screen"),
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
                // Handle the navigation to Real-time Monitoring
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor),
              title: const Text("Dashboard"),
              onTap: () {
                // Handle the navigation to Real-time Monitoring
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text("Shopping"),
              onTap: () {
                // Handle the navigation to Real-time Monitoring
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Shopping()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
