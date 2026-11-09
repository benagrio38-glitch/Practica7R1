# Nieves Dolores

App móvil hecha con Flutter: catálogo de nieves de sabores de Dolores Hidalgo. Los datos son de ejemplo.

## Pantallas

1. **Splash:** logo animado, indicador de carga y paso automático a los 3 segundos.
2. **Inicio:** barra de búsqueda, filtros por categoría (Todas, Clásicas, Frutales, Exóticas) y lista de sabores en tarjetas.
3. **Detalle:** imagen grande, precio, rareza, descripción, ingredientes y botones de favorito, compartir y pedir.

## Carpetas

- `lib/models`: la clase `Sabor`.
- `lib/data`: la lista de sabores de ejemplo.
- `lib/screens`: las tres pantallas.
- `lib/widgets`: tarjeta, imagen con respaldo y puntos de rareza.
- `assets/images`: fotos opcionales (ver `LEEME.txt`).
- `android`, `ios`, `web`, `windows`, `linux`, `macos`: configuración de cada plataforma.

## Cómo correrla

1. Abrir esta carpeta en VS Code.
2. Descargar las dependencias: `flutter pub get`
3. Ejecutar con un emulador o un celular conectado: `flutter run`
