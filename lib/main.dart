import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import here

void main() {
  runApp(const StitchWiseApp());
}

class StitchWiseApp extends StatelessWidget {
  const StitchWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StitchWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff6a1b9a),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xfffff5f8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff6a1b9a),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(), // Use it here
    );
  }
}
