import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/data/app_data.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/widgets.dart';

class ParqueosPage extends StatelessWidget {
  ParqueosPage({Key? key}) : super(key: key);
  final parqueos = Parqueo.parqueos;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < parqueos.length; i++)
              ParqueoWidget(
                parqueoColor: parqueos[i].parqueoColor,
                parqueoId: parqueos[i].parqueoId,
                numeroParqueo: parqueos[i].numeroParqueo,
                cupoParqueo: parqueos[i].cupoParqueo,
                tiempoParqueo: parqueos[i].tiempoParqueo,
                onParqueoTap: () {
                  _showMyDialog(context, parqueos[i].numeroParqueo,
                      parqueos[i].parqueoId);
                },
              ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext context, int index, int numParqueo) async {
  return showDialog<void>(
    context: context,
    builder: (_) => popupConfirmacion(context, index, numParqueo),
  );
}

Widget popupConfirmacion(BuildContext context, int index, int numParqueo) {
  return AlertDialog(
    title: const Text(
      'Confirmación',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Text(
        'Usted ha seleccionado el parqueadero #${index.toString()}, ¿Desea confirmar?'),
    actions: <Widget>[
      TextButton(
        child: const Text(
          'Si',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
          context.router.push(SelectedParqueoRoute(
            selectedId: numParqueo,
          ));
          /*Navigator.push(context,
              MaterialPageRoute(builder: (context) => SeleccionPage()));*/
        },
      ),
      TextButton(
        child: const Text(
          'No',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');

          /*Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapaPage()));*/
        },
      ),
    ],
    elevation: 24.0,
  );
}
