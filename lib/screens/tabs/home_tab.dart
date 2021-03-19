import 'dart:async';

import 'package:cab_driver/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GoogleMapController _googleMapController;
  Completer<GoogleMapController> _completer = Completer();

  Future<Position> _getCurrentPosition() async =>
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

  void _setCameraToNewPosition(Position position) {
    LatLng posLatLng = LatLng(position.latitude, position.longitude);
    _googleMapController.animateCamera(CameraUpdate.newLatLng(posLatLng));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) async {
              _googleMapController = controller;
              _completer.complete(controller);
              _setCameraToNewPosition(await _getCurrentPosition());
            },
            initialCameraPosition: kGooglePlex),
      ],
    );
  }
}
