import 'dart:math';

import 'package:flutter_grocer_app/core/Utils/log_utils.dart';
import 'package:flutter_grocer_app/core/Utils/utils.dart';
import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_grocer_app/core/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_grocer_app/core/providers/appstate_base_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart' as location;
import 'package:logger/logger.dart';

/// A viewModel kind of class for handling Map related information and updating.
/// We are using Provider with notifyListeners() for the sake of simplicity but will update with dynamic approach
/// Provider : https://pub.dev/packages/provider

class MapProvider extends AppStateBaseProvider {
  final mapScreenScaffoldKey = GlobalKey<ScaffoldState>();
  Logger log = getLogger("MapProvider");

  //Current Position and Destination Position and Pickup Point
  //LatLng _destinationPosition, _pickupPosition;

  LatLng _currentPosition = LatLng(30.3753, 69.3451);

  // Default Camera Zoom
  double currentZoom = 24;

  // show Booking Box

  // Set of all the markers on the map
  final Set<Marker> _markers = Set();

  //Map Controller
  GoogleMapController _mapController;

  // Location Object to get current Location
  location.Location _location = location.Location();

  // currentPosition Getter
  LatLng get currentPosition => _currentPosition;

  // MapController Getter
  GoogleMapController get mapController => _mapController;

  // Markers Getter
  Set<Marker> get markers => _markers;

  get randomZoom => 13.0 + Random().nextInt(4);

  /// Default Constructor
  MapProvider() {
    _getUserLocation();

    _location.onLocationChanged.listen((event) async {
      _currentPosition = LatLng(event.latitude, event.longitude);
      markers.removeWhere((marker) {
        return marker.markerId.value == Constants.currentLocationMarkerId;
      });
      markers.remove(
          Marker(markerId: MarkerId(Constants.currentLocationMarkerId)));
      markers.add(Marker(
          markerId: MarkerId(Constants.currentLocationMarkerId),
          position: _currentPosition,
          rotation: event.heading - 78,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(
            await Utils.getBytesFromAsset(
                "assets/images/currentUserIcon.png", 280),
          )));
      notifyListeners();
    });
  }

  ///Getting current Location : Works only one time
  void _getUserLocation() async {
    _location.getLocation().then((data) async {
      _currentPosition = LatLng(data.latitude, data.longitude);

      await Future.delayed(Duration(seconds: 3));
      onMyLocationFabClicked();
      notifyListeners();
    });
  }

  /// listening to camera moving event
  void onCameraMove(CameraPosition position) {
    currentZoom = position.zoom;
    notifyListeners();
  }

  /// when map is created
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void randomMapZoom() {
    mapController
        .animateCamera(CameraUpdate.zoomTo(15.0 + Random().nextInt(5)));
  }

  void onMyLocationFabClicked() {
    mapController.animateCamera(CameraUpdate.newLatLngZoom(
        currentPosition, 15.0 + Random().nextInt(4)));
  }
}
