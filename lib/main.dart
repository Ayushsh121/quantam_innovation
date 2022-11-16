import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'first_screen/Signup_screen.dart';
import 'first_screen/home_pagee.dart';
import 'first_screen/login_screen.dart';
import 'first_screen/login_signup_screen.dart';



Future< void> main() async {
  WidgetsFlutterBinding.ensureInitialized()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _fba = Firebase.initializeApp();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quantam Innovation',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fba,
        builder: (context, snap) {
          if(snap.hasError){
            return Text(snap.error.toString());
          } else if(snap.hasData) {
            return const HeadlineScreen();
          } else {
            return Text(snap.error.toString());
          }
        },
      ),
    );
  }
}


