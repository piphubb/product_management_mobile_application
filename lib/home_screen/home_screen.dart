import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:product_management_mobile_application/admin/product/screen/product_screen.dart';
import 'package:product_management_mobile_application/admin/product/screen/unit_type_screen.dart';
import 'package:product_management_mobile_application/auth/models/login_response.dart';

class HomeScreen extends StatefulWidget {
  LoginResponse? loginResponse;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalStorage storage = LocalStorage('user_login_key');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 250,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnitTypeScreen()),
                );
              },
              leading: Icon(Icons.list_alt_outlined),
              title: Text("Unit Type"),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );
              },
              leading: Icon(Icons.list_alt_outlined),
              title: Text("List Products"),
              trailing: Icon(Icons.navigate_next_rounded),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "HomeScreen",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              storage.clear();
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text("${storage.getItem("username_key")}"),
      ),
    );
  }
}
