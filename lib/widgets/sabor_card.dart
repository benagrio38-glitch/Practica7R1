import 'package:flutter/material.dart';

import '../models/sabor.dart';
import 'rareza_puntos.dart';
import 'sabor_imagen.dart';

class SaborCard extends StatelessWidget {
  final Sabor sabor;
  final bool esFavorito;
  final VoidCallback alTocar;

  const SaborCard({
    super.key,
    required this.sabor,
    required this.esFavorito,
    required this.alTocar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: alTocar,
        child: SizedBox(
          height: 112,
          child: Row(
            children: [
              SizedBox(
                width: 112,
                height: 112,
                child: Hero(
                  tag: 'sabor-${sabor.id}',
                  child: SaborImagen(sabor: sabor, alto: 112),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sabor.nombre,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            sabor.resumen,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${sabor.precio.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          RarezaPuntos(nivel: sabor.rareza, tamano: 9),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (esFavorito)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
