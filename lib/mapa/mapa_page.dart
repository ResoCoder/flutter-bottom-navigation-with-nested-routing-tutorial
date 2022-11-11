import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/data/app_data.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  // Ajusta la posicion de la camara
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(4.6665127, -74.0538209),
    zoom: 15,
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
        backgroundColor: Colors.red,
        title: const Text('UBICACION DE PARQUEADEROS'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GoogleMap(
          // Propiedad de la posicion inicial de la camara
          initialCameraPosition: _kGoogle,
          // Markers del mapa
          markers: Set<Marker>.of(_markers),
          // Tipo de mapa
          mapType: MapType.normal,
          // Ubicacion activada
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          // Compass activado
          compassEnabled: true,
          // Mapa completo del controlador
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,

      // oN Pressed lleva al usuario a la ubicacion actual.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() + " " + value.longitude.toString());

            // Marker aÃ±adido
            _markers.add(Marker(
              markerId: MarkerId("Currentlocation"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                title: 'My Current Location, Coordinates ${value.latitude}, ${value.longitude}',
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