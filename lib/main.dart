import 'package:camera/camera.dart';
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
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(ChangeNotifierProvider(
      create: (_) => null,
      child: MaterialApp(
        title: 'Trolley',
        theme: ThemeData(
          //primarySwatch: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyApp(),
        initialRoute: SignIn.idscreen,
        routes: {
          HomePage.idscreen: (context) => HomePage(),
          SignIn.idscreen: (context) => SignIn(),
          "/SignUp": (context) => SignUp(),
          "/TakePictureScreen": (context) => TakePictureScreen(
                camera: firstCamera,
              )
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
