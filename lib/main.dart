import 'package:flutter/material.dart';
import './screens/homeScreen.dart';
import './screens/loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      initialRoute: '/',
      routes: {
        '/':(context)=>LoadingScreen(),
        '/home':(context)=>HomeScreen(),
      },
    );
  }
}

