import 'package:envroapplication/Dashboard.dart';
import 'package:envroapplication/add_device.dart';
import 'package:flutter/material.dart';
import 'shopping.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Home Screen"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.green[500],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'images/EnvroLogo.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30),
              Text(
                "Making The World a Better Place",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Image.asset(
                'images/compost.jpg',
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                "Solution For Farms Waste Management",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Image.asset(
                'images/farm.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Image.asset(
                'images/MediumSizedFarmThumbsUp.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[50],
      drawer: Drawer(
        child: Builder(
          builder: (BuildContext context) {
            return ListView(
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
                  leading: const Icon(Icons.shop),
                  title: const Text("Shopping"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Shopping()),
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
                    _scaffoldKey.currentState?.openEndDrawer();
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
            );
          },
        ),
      ),
    );
  }
}
