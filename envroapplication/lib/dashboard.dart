import 'package:flutter/material.dart';
import 'add_device.dart';
import 'shopping.dart';
import 'home_screen.dart';

//final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey1,
      appBar: AppBar(
        title: const Text("Dashboard Screen"),
        automaticallyImplyLeading: false, // Disable the back button
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open the drawer when the menu button is pressed
            if (_scaffoldKey1.currentState != null) {
              _scaffoldKey1.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.green[500],
      ),
      body: const Center(
        child: Text("Welcome to the Dashboard Screen"),
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
              leading: const Icon(Icons.shop),
              title: const Text("Shopping"),
              onTap: () {
                // Handle the navigation to Real-time Monitoring
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Shopping()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.device_hub),
              title: const Text("Add Device"),
              onTap: () {
                // Handle the navigation to Real-time Monitoring
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddDevice()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
