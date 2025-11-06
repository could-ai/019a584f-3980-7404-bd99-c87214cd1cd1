import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TikTokVApp());
}

class TikTokVApp extends StatelessWidget {
  const TikTokVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTokV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Color(0xFFFF0050),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}