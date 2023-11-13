import 'package:envroapplication/Dashboard.dart';
import 'package:envroapplication/add_device.dart';
import 'package:flutter/material.dart';
//import 'Dashboard.dart';
import 'shopping.dart';
//import 'add_device.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Home Screen"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open the drawer when the menu button is pressed
            if (_scaffoldKey.currentState != null) {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.green[500],
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to the Home Screen!"),
            // ElevatedButton(
            //   onPressed: () {
            //     // Perform actions or navigate to other screens within HomeScreen
            //   },
            //   child: const Text("Perform Action"),
            // ),
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
                // Handle the navigation to the Shopping screen
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Shopping()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.device_hub),
              title: const Text("Add Device"),
              onTap: () {
                // Handle the navigation to the Shopping screen
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
