import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the LoginScreen class

void main() {
  runApp(
    MaterialApp(
      home: StartScreen(),
    ),
  );
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ENVRO APPLICATION"),
        backgroundColor: Colors.green[500],
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/EnvroLogo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome to Envro's Application",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[50],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the LoginScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Next'),
          ),
        ),
      ),
    );
  }
}
