import 'package:flutter/material.dart';

import '../models/sabor.dart';

/// Muestra la foto del sabor. Si no hay foto en assets/images/,
/// muestra un fondo de color con el icono del sabor.
class SaborImagen extends StatelessWidget {
  final Sabor sabor;
  final double? alto;

  const SaborImagen({super.key, required this.sabor, this.alto});

  Widget _respaldo() {
    return Container(
      height: alto,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [sabor.color, Color.lerp(sabor.color, Colors.black, 0.3)!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(sabor.icono, size: 48, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      sabor.imagen,
      height: alto,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _respaldo(),
    );
  }
}
