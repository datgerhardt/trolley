// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trolley/screen/home.dart';
// import 'package:trolley/screen/sign_in.dart';
// import 'package:trolley/service/auth.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthenticationService>(
//           create: (_) => AuthenticationService(FirebaseAuth.instance),
//         ),
//         StreamProvider(
//           create: (context) =>
//               context.read<AuthenticationService>().authStateChanges,
//           initialData: null,
//         )
//       ],
//       child: MaterialApp(
//         title: 'Trolley',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: AuthenticationWrapper(),
//       ),
//     );
//   }
// }

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return HomePage();
//     }
//     return SignIn();
//   }
// }
