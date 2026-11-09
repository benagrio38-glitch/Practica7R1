import 'package:flutter/material.dart';

import '../models/sabor.dart';
import '../widgets/rareza_puntos.dart';
import '../widgets/sabor_imagen.dart';

class DetalleScreen extends StatefulWidget {
  final Sabor sabor;
  final bool esFavorito;
  final ValueChanged<bool> alCambiarFavorito;

  const DetalleScreen({
    super.key,
    required this.sabor,
    required this.esFavorito,
    required this.alCambiarFavorito,
  });

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  late bool _favorito;

  @override
  void initState() {
    super.initState();
    _favorito = widget.esFavorito;
  }

  void _mensaje(String texto) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(texto)));
  }

  void _cambiarFavorito() {
    setState(() => _favorito = !_favorito);
    widget.alCambiarFavorito(_favorito);
    _mensaje(_favorito ? 'Guardada en tus favoritos' : 'Quitada de tus favoritos');
  }

  Widget _dato({required Widget icono, required String valor, required String titulo}) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 28, child: Center(child: icono)),
          const SizedBox(height: 6),
          Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(titulo, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sabor = widget.sabor;
    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(sabor.nombre),
        actions: [
          IconButton(
            tooltip: 'Favorito',
            icon: Icon(
              _favorito ? Icons.favorite : Icons.favorite_border,
              color: _favorito ? Colors.red : null,
            ),
            onPressed: _cambiarFavorito,
          ),
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: 'sabor-${sabor.id}',
            child: SaborImagen(sabor: sabor, alto: 260),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sabor.nombre,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(sabor.categoria, style: TextStyle(color: color)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _dato(
                      icono: Icon(Icons.payments_outlined, color: color),
                      valor: '\$${sabor.precio.toStringAsFixed(0)}',
                      titulo: 'Precio',
                    ),
                    _dato(
                      icono: RarezaPuntos(nivel: sabor.rareza),
                      valor: '${sabor.rareza} de 5',
                      titulo: 'Rareza',
                    ),
                    _dato(
                      icono: Icon(Icons.restaurant_menu, color: color),
                      valor: '${sabor.ingredientes.length}',
                      titulo: 'Ingredientes',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Cómo es',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(sabor.descripcion, style: const TextStyle(height: 1.4)),
                const SizedBox(height: 24),
                const Text(
                  'Lleva',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: sabor.ingredientes
                      .map((i) => Chip(label: Text(i)))
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Precio y datos de ejemplo para la práctica.',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.share),
                  label: const Text('Compartir'),
                  onPressed: () => _mensaje('Compartir: próximamente'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Pedir'),
                  onPressed: () => _mensaje('${sabor.nombre} agregada a tu pedido'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
