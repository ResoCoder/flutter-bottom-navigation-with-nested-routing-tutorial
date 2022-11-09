import 'dart:html';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Color tileColor;
  final String postTitle;
  final void Function() onTileTap;

  const PostTile({
    Key? key,
    required this.tileColor,
    required this.postTitle,
    required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        color: tileColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 40,
          ),
          child: Column(
            children: [
              Text(
                postTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParqueoWidget extends StatelessWidget {
  final Color parqueoColor;
  final int parqueoId;
  final int numeroParqueo;
  final int cupoParqueo;
  final int tiempoParqueo;
  final void Function()? onParqueoTap;
  const ParqueoWidget({
    Key? key,
    required this.parqueoColor,
    required this.parqueoId,
    required this.numeroParqueo,
    required this.cupoParqueo,
    required this.tiempoParqueo,
    this.onParqueoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onParqueoTap,
        child: Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: parqueoColor),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20), right: Radius.circular(0)),
                      color: parqueoColor,
                    ),
                    height: 100.0,
                    child: Text(
                      numeroParqueo.toString(),
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.access_time_filled,
                            color: parqueoColor,
                          ),
                          Text(
                            '$tiempoParqueo minutos',
                            style: TextStyle(color: parqueoColor),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_parking_outlined,
                            color: parqueoColor,
                          ),
                          Text(
                            '$cupoParqueo cupos',
                            style: TextStyle(color: parqueoColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    child: IconButton(
                      alignment: Alignment.center,
                      iconSize: 70,
                      icon: Icon(
                        Icons.location_on,
                        color: parqueoColor,
                      ),
                      onPressed: () {
                        context.router.push(SingleParqueoRoute(
                          parqueoId: parqueoId,
                        ));
                      },
                    ),
                  ),
                )
              ],
            )));
  }
}

class MapaParqueo extends StatelessWidget {
  final String linkImagen;
  final String numeroParqueadero;
  const MapaParqueo({
    Key? key,
    required this.linkImagen,
    required this.numeroParqueadero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          const SizedBox(height: 30),
          Container(
              alignment: Alignment.center,
              width: 430,
              height: 390,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: Image.network(
                linkImagen,
                width: 410,
                height: 390,
              )),
          const SizedBox(height: 30),
          TextButton(
            child: const Text(
              'Abrir en Google Maps',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'No Google Maps implementation in UI demonstration.')));
            },
          ),
        ]),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  final Color avatarColor;
  final String username;
  final void Function()? onAvatarTap;
  const UserAvatar({
    Key? key,
    required this.avatarColor,
    required this.username,
    this.onAvatarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: onAvatarTap,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 65,
              child: const Icon(
                Icons.person,
                size: 65,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              username,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
