import 'dart:html';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';

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

class CodigoQR extends StatelessWidget {
  const CodigoQR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: const [
          Icon(
            Icons.qr_code_2,
            size: 350.0,
          ),
          Text(
            'Puede escanear este código QR en cualquier estación de pago del servicio de parqueo.',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  // Ajusta la posicion de la camara
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // Creacion de la lista de markers
  final List<Marker> _markers = <Marker>[
    // ignore: prefer_const_constructors
  ];

  // Metodo para obtener la ubicacion actuak
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        title: Text("E PARK PARKING LOCATIONS"),
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            // Propiedad de la posicion inicial de la camara
            initialCameraPosition: _kGoogle,
            // Markers del mapa
            markers: Set<Marker>.of(_markers),
            // Tipo de mapa
            mapType: MapType.normal,
            // Ubicacion activada
            myLocationEnabled: true,
            // Compass activado
            compassEnabled: true,
            // Mapa completo del controlador
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
      // oN Pressed lleva al usuario a la ubicacion actual.
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() + " " + value.longitude.toString());

            Random random = new Random();
            int randomNumber1 = random.nextInt(100);
            int randomNumber2 = random.nextInt(100);
            int randomNumber3 = random.nextInt(100);

            // Marker añadido
            _markers.add(Marker(
              markerId: MarkerId("Currentlocation"),
              position: LatLng(11.018800, -74.851207),
              infoWindow: InfoWindow(
                title: 'My Current Location, Coordinates 11.018800,-74.851207',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ));

            _markers.add(Marker(
              markerId: MarkerId("PARQ1"),
              position: LatLng(11.019728, -74.845634),
              infoWindow: InfoWindow(
                title:
                    'Parqueadero 1, Numero de plazas disponibles $randomNumber1',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ));

            _markers.add(Marker(
              markerId: MarkerId("PARQ2"),
              position: LatLng(11.020297, -74.849561),
              infoWindow: InfoWindow(
                title:
                    'Parquadero 2, Numero de plazas disponibles $randomNumber2',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ));

            _markers.add(Marker(
              markerId: MarkerId("PARQ3"),
              position: LatLng(11.020107, -74.848735),
              infoWindow: InfoWindow(
                title:
                    'Parquadero 3, Numero de plazas disponibles $randomNumber3',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ));

            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(11.018800, -74.851207),
              zoom: 15,
            );

            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: Icon(Icons.travel_explore),
      ),
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
