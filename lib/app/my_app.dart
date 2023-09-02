import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:product_management_mobile_application/auth/screens/login_screen.dart';
import 'package:product_management_mobile_application/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('user_login_key');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, snapshot){
          var username = storage.getItem("username_key");
          if(username != null){
            return HomeScreen();
          }
          return LoginScreen();
        }
      ),
    );
  }
}
