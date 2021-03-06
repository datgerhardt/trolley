import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley/service/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String idscreen = 'signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ButtonStyle style = ElevatedButton.styleFrom(
    // background color
    primary: Colors.black,
    padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
    //textStyle: TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Create an account",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
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
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.pushNamed(context, "/TakePictureScreen");
              context.read<AuthenticationService>().signUp(
                  email: emailController.text,
                  password: passwordController.text);
              // ignore: unnecessary_statements
              // Navigator.defaultRouteName;
            },
            child: Text("Sign up"),
          )
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
