import 'package:flutter/material.dart';
import 'api_service.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String result = "";

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    try {
      final res = await apiService.get("/user-area");
      setState(() {
        result = res.data.toString();
      });
    } catch (e) {
      result = "Access Denied";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User")),
      body: Center(child: Text(result)),
    );
  }
}
