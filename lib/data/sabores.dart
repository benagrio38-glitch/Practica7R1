import 'package:flutter/material.dart';

import '../models/sabor.dart';

const List<String> categorias = ['Todas', 'Clásicas', 'Frutales', 'Exóticas'];

// Datos de ejemplo (mock data). Los precios no son de ninguna nevería real.
const List<Sabor> sabores = [
  Sabor(
    id: 'vainilla',
    nombre: 'Vainilla',
    categoria: 'Clásicas',
    resumen: 'Suave, cremosa y con aroma dulce.',
    descripcion:
        'La nieve de siempre. Lleva leche, crema y vainilla, y combina con casi cualquier cosa.',
    precio: 25,
    rareza: 1,
    ingredientes: ['Leche', 'Crema', 'Azúcar', 'Vainilla'],
    color: Color(0xFFF2D49B),
    icono: Icons.icecream,
  ),
  Sabor(
    id: 'chocolate',
    nombre: 'Chocolate',
    categoria: 'Clásicas',
    resumen: 'Intensa y con cacao de sobra.',
    descripcion:
        'Una nieve densa de chocolate amargo con un toque de leche para que no se sienta pesada.',
    precio: 28,
    rareza: 1,
    ingredientes: ['Leche', 'Cacao', 'Azúcar', 'Crema'],
    color: Color(0xFF6D4C41),
    icono: Icons.cake,
  ),
  Sabor(
    id: 'fresa',
    nombre: 'Fresa con crema',
    categoria: 'Clásicas',
    resumen: 'Fresa natural con crema espesa.',
    descripcion:
        'Se hace con fresa molida y un poco de crema. Queda de color rosa y con trocitos de fruta.',
    precio: 28,
    rareza: 1,
    ingredientes: ['Fresa', 'Crema', 'Azúcar', 'Leche'],
    color: Color(0xFFE57399),
    icono: Icons.favorite,
  ),
  Sabor(
    id: 'limon',
    nombre: 'Limón',
    categoria: 'Frutales',
    resumen: 'Fresca y ácida, ideal para el calor.',
    descripcion:
        'Es más una nieve de agua que de leche. Se siente ligera y deja la boca fresca.',
    precio: 22,
    rareza: 1,
    ingredientes: ['Limón', 'Agua', 'Azúcar'],
    color: Color(0xFFC6D84B),
    icono: Icons.eco,
  ),
  Sabor(
    id: 'mango',
    nombre: 'Mango con chile',
    categoria: 'Frutales',
    resumen: 'Dulce de mango con un toque picante.',
    descripcion:
        'Mango maduro con un poco de chile en polvo y limón. Primero dulce y al final pica poquito.',
    precio: 30,
    rareza: 2,
    ingredientes: ['Mango', 'Chile en polvo', 'Limón', 'Azúcar'],
    color: Color(0xFFFFA726),
    icono: Icons.whatshot,
  ),
  Sabor(
    id: 'guayaba',
    nombre: 'Guayaba',
    categoria: 'Frutales',
    resumen: 'Aromática, con sabor a fruta de rancho.',
    descripcion:
        'Se prepara con guayaba rosa. Tiene un aroma fuerte y una textura un poco arenosa muy típica.',
    precio: 24,
    rareza: 2,
    ingredientes: ['Guayaba', 'Agua', 'Azúcar'],
    color: Color(0xFFEF8A8A),
    icono: Icons.spa,
  ),
  Sabor(
    id: 'tuna',
    nombre: 'Tuna roja',
    categoria: 'Frutales',
    resumen: 'Dulce y de color intenso.',
    descripcion:
        'La tuna le da un color magenta muy fuerte. Es dulce, jugosa y se come mejor bien fría.',
    precio: 26,
    rareza: 3,
    ingredientes: ['Tuna roja', 'Agua', 'Azúcar', 'Limón'],
    color: Color(0xFFC2185B),
    icono: Icons.local_florist,
  ),
  Sabor(
    id: 'aguacate',
    nombre: 'Aguacate',
    categoria: 'Exóticas',
    resumen: 'Cremosa, verde y sorprendentemente suave.',
    descripcion:
        'Aguacate maduro con leche y azúcar. Queda cremosa, sin sabor a ensalada, y casi no se nota que es verdura.',
    precio: 32,
    rareza: 3,
    ingredientes: ['Aguacate', 'Leche', 'Azúcar', 'Limón'],
    color: Color(0xFF7CB342),
    icono: Icons.eco,
  ),
  Sabor(
    id: 'elote',
    nombre: 'Elote',
    categoria: 'Exóticas',
    resumen: 'Sabe a elote cocido con leche.',
    descripcion:
        'Se hace con granos de elote tierno, leche y un poco de canela. Es dulce y deja un sabor muy de feria.',
    precio: 30,
    rareza: 3,
    ingredientes: ['Elote', 'Leche', 'Canela', 'Azúcar'],
    color: Color(0xFFFBC02D),
    icono: Icons.grain,
  ),
  Sabor(
    id: 'mole',
    nombre: 'Mole',
    categoria: 'Exóticas',
    resumen: 'Dulce, con chocolate y especias.',
    descripcion:
        'Una versión helada del mole: cacao, chiles suaves, almendra y canela. No pica casi nada.',
    precio: 35,
    rareza: 4,
    ingredientes: ['Cacao', 'Chile ancho', 'Almendra', 'Canela', 'Leche'],
    color: Color(0xFF5D4037),
    icono: Icons.whatshot,
  ),
  Sabor(
    id: 'pulque',
    nombre: 'Pulque curado',
    categoria: 'Exóticas',
    resumen: 'Ligeramente agria y con fruta.',
    descripcion:
        'Se prepara con pulque curado de fruta. Tiene un sabor ácido y fermentado, para los que quieren probar algo distinto. Solo para mayores de edad.',
    precio: 38,
    rareza: 5,
    ingredientes: ['Pulque', 'Fruta', 'Azúcar', 'Limón'],
    color: Color(0xFFBCAAA4),
    icono: Icons.local_bar,
  ),
  Sabor(
    id: 'tequila',
    nombre: 'Tequila',
    categoria: 'Exóticas',
    resumen: 'Cítrica y con un toque de agave.',
    descripcion:
        'Una nieve de limón con un poco de tequila. Se siente fuerte al final. Solo para mayores de edad.',
    precio: 40,
    rareza: 5,
    ingredientes: ['Tequila', 'Limón', 'Agua', 'Azúcar'],
    color: Color(0xFF9CCC65),
    icono: Icons.local_bar,
  ),
];
