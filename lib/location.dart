import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class location extends StatefulWidget {

  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _location;

  @override
  void initState() {
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [
    Marker(
        markerId: MarkerId('my location'),
        infoWindow: InfoWindow(title: 'this is my location'),
        position: LatLng(21.543333, 39.172779)),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 200,
              width: 350,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(21.543333, 39.172779),
                      zoom: 11.0,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: markers.toSet(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkLocationServicesInDevice() async {
    Location location = new Location();

    _serviceEnabled = await location.serviceEnabled();

    if (_serviceEnabled) {
      _permissionGranted = await location.hasPermission();

      if (_permissionGranted == PermissionStatus.granted) {
        _location = await location.getLocation();
        print(_location.latitude.toString() +
            " " +
            _location.longitude.toString());
      } else {
        _permissionGranted = await location.requestPermission();

        if (_permissionGranted == PermissionStatus.granted) {
          print('user allowed');
        } else {
          SystemNavigator.pop();
        }
      }
    } else {
      _serviceEnabled = await location.requestService();

      if (_serviceEnabled) {
        _permissionGranted = await location.hasPermission();

        if (_permissionGranted == PermissionStatus.granted) {
          print('user allowed before');
        } else {
          _permissionGranted = await location.requestPermission();

          if (_permissionGranted == PermissionStatus.granted) {
            print('user allowed');
          } else {
            SystemNavigator.pop();
          }
        }
      } else {
        SystemNavigator.pop();
      }
    }
  }
}
