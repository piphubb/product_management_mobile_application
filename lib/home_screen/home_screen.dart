import 'package:flutter/material.dart';
import 'package:product_management_mobile_application/auth/models/login_response.dart';

class HomeScreen extends StatefulWidget {
  LoginResponse? loginResponse;
  HomeScreen({super.key, this.loginResponse});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: Text("${widget.loginResponse!.username!.toUpperCase()}"),
      ),
    );
  }
}
