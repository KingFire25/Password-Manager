// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:demo/authservice.dart';
import 'package:demo/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'register.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Demo',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthService().auth.authStateChanges(),
        builder: (context,snapshot) {
          if(snapshot.hasData)
            return LoginPage();
          return RegisterSc();
        },
      )
    );
  }
}