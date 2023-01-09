import 'package:flutter/material.dart';
import 'package:kocevskiles/Homescreen.dart';

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
      title: 'kocevskiles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homescreen(title: 'Paketi'),
    );
  }
}