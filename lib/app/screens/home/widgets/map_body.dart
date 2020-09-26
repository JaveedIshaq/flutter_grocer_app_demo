import 'package:flutter_grocer_app/core/providers/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapProvider mapProvider = Provider.of<MapProvider>(context);
    return mapProvider.currentPosition == null
        ? Container()
        : GoogleMap(
            initialCameraPosition: CameraPosition(
                target: mapProvider.currentPosition,
                zoom: mapProvider.currentZoom),
            onMapCreated: mapProvider.onMapCreated,
            mapType: MapType.normal,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true,
            markers: mapProvider.markers,
            onCameraMove: mapProvider.onCameraMove,
            myLocationEnabled: true,
          );
  }
}
