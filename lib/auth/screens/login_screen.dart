import 'package:flutter/material.dart';
import 'package:product_management_mobile_application/auth/models/login_request.dart';
import 'package:product_management_mobile_application/auth/models/login_response.dart';
import 'package:product_management_mobile_application/auth/presenters/login_presenter.dart';
import 'package:product_management_mobile_application/auth/views/login_view.dart';
import 'package:product_management_mobile_application/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  late LoginPresenter presenter;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _keyForm,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                      hintText: "Username",
                      label: Text("Username"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 1),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: "Password",
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
              ),
              loading == false
                  ? Container()
                  : Container(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_keyForm.currentState!.validate()) {
            print("Username : ${_usernameController.text}");
            print("Password : ${_passwordController.text}");
            LoginRequest req = LoginRequest();
            req.username = _usernameController.text;
            req.password = _passwordController.text;
            presenter.login(req);
          }
        },
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          height: 60,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void onError(String message) {
    print("Error ${{message}}");
  }

  @override
  void onHiding() {
    setState(() {
      loading = false;
    });
  }

  @override
  void onLoading() {
    setState(() {
      loading = true;
    });
  }

  @override
  void onLoginSuccess(LoginResponse res) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            loginResponse: res,
          ),
        ));
  }
}
