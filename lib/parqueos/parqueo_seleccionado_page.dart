import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/data/app_data.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/widgets.dart';

class SelectedParqueoPage extends StatelessWidget {
  final int selectedId;
  SelectedParqueoPage({
    Key? key,
    @PathParam() required this.selectedId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final parqueo = Parqueo.parqueos[selectedId];
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ParqueoWidget(
              parqueoColor: parqueo.parqueoColor,
              parqueoId: parqueo.parqueoId,
              numeroParqueo: parqueo.numeroParqueo,
              cupoParqueo: parqueo.cupoParqueo,
              tiempoParqueo: parqueo.tiempoParqueo,
              onParqueoTap: () {
                null;
              },
            ),
            const SizedBox(height: 30),
            const CodigoQR(),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String index) async {
  return showDialog<void>(
    context: context,
    builder: (_) => popupConfirmacion(context, index),
  );
}

Widget popupConfirmacion(BuildContext context, String index) {
  return AlertDialog(
    title: const Text(
      'Confirmación',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content:
        Text('Usted ha seleccionado el parqueadero #$index, ¿Desea confirmar?'),
    actions: <Widget>[
      TextButton(
        child: const Text(
          'Si',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
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
