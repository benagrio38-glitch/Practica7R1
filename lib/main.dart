import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const NievesApp());
}

class NievesApp extends StatelessWidget {
  const NievesApp({super.key});

  @override
  Widget build(BuildContext context) {
    const rosa = Color(0xFFD81B60);

    return MaterialApp(
      title: 'Nieves Dolores',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: rosa),
        scaffoldBackgroundColor: const Color(0xFFFFF8F1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF8F1),
          foregroundColor: Color(0xFF4A1A2C),
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
