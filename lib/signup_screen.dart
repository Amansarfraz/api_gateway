import 'package:flutter/material.dart';
import 'api_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  String message = "";

  void signup() async {
    try {
      await apiService.signup(username.text, password.text);

      setState(() {
        message = "Signup Success! Go back and login.";
      });
    } catch (e) {
      print(e);
      setState(() {
        message = "Signup Failed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: signup, child: Text("Signup")),
            Text(message),
          ],
        ),
      ),
    );
  }
}
