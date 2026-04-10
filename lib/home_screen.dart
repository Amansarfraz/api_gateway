// import 'package:flutter/material.dart';
// import 'api_service.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String result = "";

//   void callApi(String path) async {
//     try {
//       final res = await apiService.get(path);
//       setState(() {
//         result = res.data.toString();
//       });
//     } catch (e) {
//       setState(() {
//         result = "Error: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () => callApi("/protected"),
//               child: Text("Protected"),
//             ),
//             ElevatedButton(
//               onPressed: () => callApi("/admin-area"),
//               child: Text("Admin Area"),
//             ),
//             ElevatedButton(
//               onPressed: () => callApi("/user-area"),
//               child: Text("User Area"),
//             ),
//             ElevatedButton(
//               onPressed: () => callApi("/rate-limited"),
//               child: Text("Rate Limited"),
//             ),
//             ElevatedButton(
//               onPressed: () => callApi("/proxy"),
//               child: Text("Proxy API"),
//             ),
//             SizedBox(height: 20),
//             Text(result),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'admin_screen.dart';
import 'user_screen.dart';
import 'proxy_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";

  // ✅ Protected API
  void callProtected() async {
    try {
      final res = await apiService.get("/protected");
      setState(() {
        result = res.data.toString();
      });
    } catch (e) {
      setState(() {
        result = "Error: Unauthorized";
      });
    }
  }

  // ✅ Rate Limit API
  void callRateLimit() async {
    try {
      final res = await apiService.get("/rate-limited");
      setState(() {
        result = res.data.toString();
      });
    } catch (e) {
      setState(() {
        result = "Error: Too many requests";
      });
    }
  }

  // 🔁 Common button UI
  Widget buildButton(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔐 Protected
            buildButton("Protected API", callProtected),

            // 👑 Admin Screen
            buildButton("Admin Area", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AdminScreen()),
              );
            }),

            // 👤 User Screen
            buildButton("User Area", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => UserScreen()),
              );
            }),

            // 🌐 Proxy Screen
            buildButton("Proxy API", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProxyScreen()),
              );
            }),

            // ⏱ Rate Limit
            buildButton("Rate Limited API", callRateLimit),

            SizedBox(height: 20),

            // 📦 Result Box
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Text(result, style: TextStyle(fontSize: 14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
