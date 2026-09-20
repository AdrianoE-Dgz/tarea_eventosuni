import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String titulo;
  final String categoria;
  final String fecha;
  final String hora;
  final String lugar;
  final String cupo;
  final String imagen;

  const EventCard({
    super.key,
    required this.titulo,
    required this.categoria,
    required this.fecha,
    required this.hora,
    required this.lugar,
    required this.cupo,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(25),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 400) {
              // Large screen layout
              return DesktopEventCard(
                titulo: titulo,
                categoria: categoria,
                fecha: fecha,
                hora: hora,
                lugar: lugar,
                cupo: cupo,
                imagen: imagen,
              );
            } else {
              // Small screen layout
              return MobileEventCard(
                titulo: titulo,
                categoria: categoria,
                fecha: fecha,
                hora: hora,
                lugar: lugar,
                cupo: cupo,
                imagen: imagen,
              );
            }
          },
        ),
      ),
    );
  }
}

class MobileEventCard extends StatelessWidget {
  final String titulo;
  final String categoria;
  final String fecha;
  final String hora;
  final String lugar;
  final String cupo;
  final String imagen;

  const MobileEventCard({
    super.key,
    required this.titulo,
    required this.categoria,
    required this.fecha,
    required this.hora,
    required this.lugar,
    required this.cupo,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
                    right: 0,
                    top: 18,
                    child: Chip(
                      label: Text(categoria, style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)), side: BorderSide(width: 0, color: Theme.of(context).colorScheme.primary)),
                    )
                  ),
        Text(
                titulo,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight(1000), color: Theme.of(context).colorScheme.primary),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Fecha de Incio: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: fecha),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Hora de Incio: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: hora),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Dirección: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: lugar),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Cupo total: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: cupo),
                  ],
                ),
              ),
        SizedBox(height: 15),
        Image.network(
            imagen,
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        SizedBox(height: 15),
        Center(
          child: ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Se ha registrado al evento $titulo!'),
                      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      action: SnackBarAction(
                        label: 'De acuerdo',
                        onPressed: () {
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text(
                    'Registrarme',
                  ),
                ),
        )
      ],
    );
  }
}

class DesktopEventCard extends StatelessWidget {
  final String titulo;
  final String categoria;
  final String fecha;
  final String hora;
  final String lugar;
  final String cupo;
  final String imagen;

  const DesktopEventCard({
    super.key,
    required this.titulo,
    required this.categoria,
    required this.fecha,
    required this.hora,
    required this.lugar,
    required this.cupo,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    double width = size.width;

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight(1000), color: Theme.of(context).colorScheme.primary),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Fecha de Incio: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: fecha),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Hora de Incio: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: hora),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Dirección: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: lugar),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Cupo total: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: cupo),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(height: 0),
              ),
              ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Se ha registrado al evento $titulo!'),
                      backgroundColor: (Theme.of(context).colorScheme.onPrimaryContainer),
                      action: SnackBarAction(
                        label: 'De acuerdo',
                        onPressed: () {
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text(
                    'Registrarme',
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imagen,
                    height: double.infinity,
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),

                  Positioned(
                    right: 0,
                    top: 18,
                    child: Chip(
                      label: Text(categoria, style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)), side: BorderSide(width: 0, color: Theme.of(context).colorScheme.primary)),
                    )
                  ),
                ],
              ),
            ),
        ),
      ],
    );
  }
}
