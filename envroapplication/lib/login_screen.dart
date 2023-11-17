import 'package:envroapplication/main.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Define variables to store user input
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        automaticallyImplyLeading: false, // Disable the back button
        backgroundColor: Colors.green[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              SizedBox(height: 20,),
              TextField(
                controller:
                    usernameController, // Connect the controller to the TextField
                decoration: const InputDecoration(
                  labelText: "Username",
                  hintText: "Enter your username",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:
                    passwordController, // Connect the controller to the TextField
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredUsername =
                      usernameController.text; // Get user input
                  String enteredPassword =
                      passwordController.text; // Get user input

                  if (enteredUsername == "UserTest101" &&
                      enteredPassword == "12345") {
                    // Successful login, navigate to the next screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    // Invalid credentials, show an error message
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Login Error"),
                          content: const Text("Invalid username or password."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[500],
                ),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Implement the navigation to the sign-up screen
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[50],
    );
  }
}
