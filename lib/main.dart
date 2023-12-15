import 'package:climasphere/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Climasphere());
}

class Climasphere extends StatelessWidget {
  const Climasphere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen()
    );
  }
}