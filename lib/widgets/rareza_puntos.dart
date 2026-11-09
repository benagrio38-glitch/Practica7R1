import 'package:flutter/material.dart';

/// Cinco puntos que indican qué tan rara es la nieve (1 a 5).
class RarezaPuntos extends StatelessWidget {
  final int nivel;
  final double tamano;

  const RarezaPuntos({super.key, required this.nivel, this.tamano = 10});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        return Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Icon(
            i < nivel ? Icons.circle : Icons.circle_outlined,
            size: tamano,
            color: color,
          ),
        );
      }),
    );
  }
}
