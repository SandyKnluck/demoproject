import 'package:demoproject/animation/traffic_light.dart';
import 'package:demoproject/custom_card/profile_page.dart';
//import 'package:demoproject/product_management/product_main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default theme mode is light
  ThemeMode _themeMode = ThemeMode.light;

  // Toggle theme function
  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThemeMode Demo',
      debugShowCheckedModeBanner: false,
      /*
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 239, 252, 255),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 202, 219),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      ),
      themeMode: _themeMode,
      // Set the theme mode (light or dark)
      //home: ProfilePage(toggleTheme: _toggleTheme),
      */
      home: const TrafficLight(),
    );
  }
}
