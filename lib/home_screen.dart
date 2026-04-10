import 'package:flutter/material.dart';
import 'admin_screen.dart';
import 'user_screen.dart';
import 'proxy_screen.dart';
import 'api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";

  void callProtected() async {
    final res = await apiService.getProtected();
    setState(() {
      result = res.data.toString();
    });
  }

  void callRateLimited() async {
    final res = await apiService.getRateLimited();
    setState(() {
      result = res.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: callProtected, child: Text("Protected")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AdminScreen()),
                );
              },
              child: Text("Admin Area"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserScreen()),
                );
              },
              child: Text("User Area"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProxyScreen()),
                );
              },
              child: Text("Proxy API"),
            ),
            ElevatedButton(
              onPressed: callRateLimited,
              child: Text("Rate Limited"),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
