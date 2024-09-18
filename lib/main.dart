import 'package:flutter/material.dart';
import 'package:modularbmi/home_screen.dart';

main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(
          (0xff0A0D22),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 14, 18, 48),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
