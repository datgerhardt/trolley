import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley/camera.dart';
import 'package:trolley/screen/home.dart';
import 'package:trolley/screen/sign_in.dart';
import 'package:trolley/screen/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (_) => null,
      child: MaterialApp(
        title: 'Trolley',
        theme: ThemeData(
          //primarySwatch: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          primaryColor: Colors.black,
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Montserrat',

          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 150.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
        home: MyApp(),
        initialRoute: SignIn.idscreen,
        routes: {
          HomePage.idscreen: (context) => HomePage(),
          SignIn.idscreen: (context) => SignIn(),
          "/snap": (context) => ImgCamera(),
          "/SignUp": (context) => SignUp(),
        },
      )));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _error = false;
  bool _initialized = false;

  void _initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      setState(() => _initialized = true);
    } catch (e) {
      setState(() => _error = true);
    }
  }

  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Widget build(BuildContext context) {
    if (_error) {
      return Container(
        color: Colors.white,
        child: Center(child: Text('An error occured')),
      );
    }

    if (!_initialized) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SignIn();
  }
}
