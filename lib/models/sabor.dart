import 'package:flutter/material.dart';

class Sabor {
  final String id;
  final String nombre;
  final String categoria;
  final String resumen;
  final String descripcion;
  final double precio;
  final int rareza; // del 1 al 5
  final List<String> ingredientes;
  final Color color;
  final IconData icono;

  const Sabor({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.resumen,
    required this.descripcion,
    required this.precio,
    required this.rareza,
    required this.ingredientes,
    required this.color,
    required this.icono,
  });

  // Si existe una foto con este nombre en assets/images/, se usa.
  // Si no existe, la app muestra un fondo de color con un icono.
  String get imagen => 'assets/images/$id.jpg';
}
