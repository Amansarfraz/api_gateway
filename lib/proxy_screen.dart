import 'package:flutter/material.dart';
import 'api_service.dart';

class ProxyScreen extends StatefulWidget {
  @override
  _ProxyScreenState createState() => _ProxyScreenState();
}

class _ProxyScreenState extends State<ProxyScreen> {
  String result = "";

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final res = await apiService.get("/proxy");
    setState(() {
      result = res.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Proxy")),
      body: Padding(padding: EdgeInsets.all(20), child: Text(result)),
    );
  }
}
