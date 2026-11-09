import 'package:flutter/material.dart';

import '../data/sabores.dart';
import '../models/sabor.dart';
import '../widgets/sabor_card.dart';
import 'detalle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categoria = 'Todas';
  String _texto = '';
  final Set<String> _favoritos = {};

  List<Sabor> get _visibles {
    final busqueda = _texto.trim().toLowerCase();

    return sabores.where((s) {
      final coincideCategoria = _categoria == 'Todas' || s.categoria == _categoria;
      final coincideTexto = s.nombre.toLowerCase().contains(busqueda) ||
          s.resumen.toLowerCase().contains(busqueda);
      return coincideCategoria && coincideTexto;
    }).toList();
  }

  void _abrirDetalle(Sabor sabor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetalleScreen(
          sabor: sabor,
          esFavorito: _favoritos.contains(sabor.id),
          alCambiarFavorito: (valor) {
            setState(() {
              if (valor) {
                _favoritos.add(sabor.id);
              } else {
                _favoritos.remove(sabor.id);
              }
            });
          },
        ),
      ),
    );
  }

  void _abrirPerfil() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mi perfil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('Sabores favoritos: ${_favoritos.length}'),
            const SizedBox(height: 4),
            Text('Sabores en el catálogo: ${sabores.length}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lista = _visibles;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nieves Dolores',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Perfil',
            onPressed: _abrirPerfil,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: SearchBar(
              hintText: 'Busca un sabor',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll<double>(1),
              onChanged: (valor) => setState(() => _texto = valor),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SegmentedButton<String>(
              showSelectedIcon: false,
              segments: categorias
                  .map((c) => ButtonSegment<String>(value: c, label: Text(c)))
                  .toList(),
              selected: {_categoria},
              onSelectionChanged: (seleccion) {
                setState(() => _categoria = seleccion.first);
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: lista.isEmpty
                ? const Center(child: Text('No hay sabores con ese nombre'))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      final sabor = lista[index];
                      return SaborCard(
                        sabor: sabor,
                        esFavorito: _favoritos.contains(sabor.id),
                        alTocar: () => _abrirDetalle(sabor),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
