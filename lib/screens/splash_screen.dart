import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animacion;
  Timer? _temporizador;

  @override
  void initState() {
    super.initState();

    // El logo aparece poco a poco al abrir la app.
    _animacion = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    // A los 3 segundos pasa solo a la pantalla principal.
    _temporizador = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    _animacion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD81B60),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animacion,
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _animacion,
                  curve: Curves.elasticOut,
                ),
                child: const CircleAvatar(
                  radius: 64,
                  backgroundColor: Color(0xFFFFF8F1),
                  child: Icon(
                    Icons.icecream,
                    size: 72,
                    color: Color(0xFFD81B60),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Nieves Dolores',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Sabores que no te esperas',
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 44),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
