import 'package:flutter/material.dart';
import 'package:weatherapp/main_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.amber,


      ),
      home: const HomeScreen(),
    );
  }
}
