import 'package:flutter/material.dart';
import 'package:tarea_eventosuni/widgets/event_card.dart';
import 'package:tarea_eventosuni/data/event_data.dart';
import 'package:tarea_eventosuni/widgets/category_chip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _categoriaSeleccionada = 'Todos';

  List<Map<String, String>> _listEventos = eventos;

  List<Map<String, String>> _obtenerEventos() {
    final List<Map<String, String>> res = [];

    if (_categoriaSeleccionada == "Todos") {
      for (final evento in eventos) {
        res.add(evento);
      }
    } else {
      for (final evento in eventos) {
        if (evento['categoria'] == _categoriaSeleccionada) res.add(evento);
      }
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;

    int _cantEventos = _listEventos.length;

    int countItem = 1;
    double eventHeight = 475;
    double space = size.width;

    if (orientation == Orientation.landscape || space > 800.0) {
      countItem = 2;
      eventHeight = 300;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: Text(
          'Eventos Universitarios',
          style: Theme.of(context).textTheme.headlineLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Hola estudiante',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          SizedBox(height: 4),

          Text(
            'Que quieres aprender',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          const SizedBox(height: 22),

          SizedBox(
            height: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://fotografias.lasexta.com/clipping/cmsimages02/2023/06/12/2D1E1A88-3CCB-4EF5-BFAC-65A34B6706F3/fondos-pantalla-clasicos-windows-calidad_98.jpg?crop=1300,731,x0,y0&width=1900&height=1069&optimize=high&format=webply',
                    fit: BoxFit.cover,
                  ),

                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),

                  const Positioned(
                    left: 20,
                    right: 20,
                    bottom: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aprende algo nuevo hoy...',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('Categorias', style: Theme.of(context).textTheme.titleLarge),

              Text('Eventos: $_cantEventos'),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8);
              },

              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return CategoryChip(
                  label: categoria,
                  selected: _categoriaSeleccionada == categoria,
                  onTap: () {
                    setState(() {
                      _categoriaSeleccionada = categoria;
                    });

                    _listEventos = _obtenerEventos();
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _listEventos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: countItem,
              mainAxisExtent: eventHeight,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),

            itemBuilder: (context, index) {
              final evento = _listEventos[index];

              return EventCard(
                titulo: evento['titulo'] as String,
                categoria: evento['categoria'] as String,
                fecha: evento['fecha'] as String,
                hora: evento['hora'] as String,
                lugar: evento['lugar'] as String,
                cupo: evento['cupo'] as String,
                imagen: evento['imagen'] as String,
              );
            },
          ),
        ],
      ),
    );
  }
}
