import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  MapView({Key? key}) : super(key: key);

  final MapController mapppController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps'),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapppController,
            options: const MapOptions(
              initialCenter: LatLng(53.36056, 83.76361),
              initialZoom: 10.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    rotate: true,
                    width: 50.00,
                    height: 50.00,
                    point: LatLng(53.36056, 83.76361),
                    child: Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 127, 2, 0),
                      size: 50,
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  mapppController.move(
                      mapppController.center, mapppController.zoom + 1.0);
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 10.0,
                height: 20.00,
              ),
              FloatingActionButton(
                onPressed: () {
                  mapppController.move(
                      mapppController.center, mapppController.zoom - 1.0);
                },
                child: const Icon(Icons.minimize_sharp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
