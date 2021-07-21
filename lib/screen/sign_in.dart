import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley/service/auth.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
  static const String idscreen = 'signin';
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      // background color
      primary: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
      //textStyle: TextStyle(fontSize: 20),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
                labelText: "Password",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: style,
              onPressed: () {
                // ignore: unnecessary_statements
                Navigator.pushNamed(context, "/TakePictureScreen");
                context.read<AuthenticationService>().signIn(
                    email: emailController.text,
                    password: passwordController.text);
              },
              child: Text("Sign In"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: ElevatedButton(
              style: style,
              onPressed: () {
                // ignore: unnecessary_statements
                Navigator.pushNamed(context, "/SignUp");
                print("Sign UP ");
              },
              child: Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
