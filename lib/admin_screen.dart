import 'package:flutter/material.dart';
import 'api_service.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String result = "";

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    try {
      final res = await apiService.get("/admin-area");
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
      appBar: AppBar(title: Text("Admin")),
      body: Center(child: Text(result)),
    );
  }
}
