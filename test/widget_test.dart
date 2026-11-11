// Pruebas de Nieves Dolores: datos de ejemplo, splash, búsqueda y filtros.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nieves_dolores/data/sabores.dart';
import 'package:nieves_dolores/main.dart';

// Deja pasar el splash (3 segundos) y la transición a la pantalla de inicio.
Future<void> _pasarSplash(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 3));
  await tester.pump(const Duration(seconds: 1));
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  group('Datos de ejemplo', () {
    test('hay 12 sabores con ids únicos', () {
      expect(sabores.length, 12);
      expect(sabores.map((s) => s.id).toSet().length, 12);
    });

    test('cada sabor tiene precio, rareza del 1 al 5 e ingredientes', () {
      for (final s in sabores) {
        expect(s.precio, greaterThan(0));
        expect(s.rareza, inInclusiveRange(1, 5));
        expect(s.ingredientes, isNotEmpty);
      }
    });

    test('la ruta de la imagen sale del id del sabor', () {
      expect(sabores.first.imagen, 'assets/images/${sabores.first.id}.jpg');
    });
  });

  group('Pantallas', () {
    testWidgets('el splash muestra el nombre y pasa a la lista',
        (WidgetTester tester) async {
      await tester.pumpWidget(const NievesApp());
      expect(find.text('Nieves Dolores'), findsOneWidget);

      await _pasarSplash(tester);

      expect(find.text('Busca un sabor'), findsOneWidget);
      expect(find.text('Vainilla'), findsOneWidget);
    });

    testWidgets('el filtro Frutales deja solo nieves frutales',
        (WidgetTester tester) async {
      await tester.pumpWidget(const NievesApp());
      await _pasarSplash(tester);

      await tester.tap(find.text('Frutales'));
      await tester.pump();

      expect(find.text('Limón'), findsOneWidget);
      expect(find.text('Vainilla'), findsNothing);
    });

    testWidgets('el buscador filtra por nombre y avisa si no hay resultados',
        (WidgetTester tester) async {
      await tester.pumpWidget(const NievesApp());
      await _pasarSplash(tester);

      await tester.enterText(find.byType(TextField), 'man');
      await tester.pump();
      expect(find.text('Mango con chile'), findsOneWidget);
      expect(find.text('Vainilla'), findsNothing);

      await tester.enterText(find.byType(TextField), 'zzzz');
      await tester.pump();
      expect(find.text('No hay sabores con ese nombre'), findsOneWidget);
    });
  });
}
