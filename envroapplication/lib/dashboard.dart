import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'add_device.dart';
import 'shopping.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey1,
      appBar: AppBar(
        title: const Text("Dashboard Screen"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            if (_scaffoldKey1.currentState != null) {
              _scaffoldKey1.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.green[500],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            SizedBox(
              height: 150,
              child: buildOptimumConditionPieChart(),
            ),
            SizedBox(height: 20),
            Text("Real-time Sensor Data"),
            SizedBox(height: 20),
            buildSensorDataCard("Gas Level", "450 ppm"),
            buildSensorDataCard("Temperature", "25.5°C"),
            buildSensorDataCard("Soil Moisture", "42%"),
            SizedBox(height: 20),
            Text("Status"),
            SizedBox(height: 20),
            buildStatusCard("Heating Element", "On"),
            buildStatusCard("Actuator", "On"),
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
                  //color: Colors white,
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
                _scaffoldKey1.currentState?.openEndDrawer();
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

  PieChartData buildOptimumConditionData() {
    return PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 40,
      sections: [
        PieChartSectionData(
          title: "Gas Level \n 450ppm",
          value: 40,
          color: Colors.blue,
        ),
        PieChartSectionData(
          title: "Temperature \n 25.5C",
          value: 30,
          color: Colors.yellow,
        ),
        PieChartSectionData(
          title: "Moisture Level \n 42%",
          value: 30,
          color: Colors.red,
        ),
      ],
    );
  }

  Widget buildOptimumConditionPieChart() {
    return SizedBox(
      height: 150,
      child: PieChart(
        buildOptimumConditionData(),
      ),
    );
  }

  Widget buildSensorDataCard(String sensorName, String sensorValue) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sensorName),
            Text("$sensorValue"),
          ],
        ),
      ),
    );
  }

  Widget buildStatusCard(String statusName, String statusValue) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(statusName),
            Text("$statusValue"),
          ],
        ),
      ),
    );
  }
}

