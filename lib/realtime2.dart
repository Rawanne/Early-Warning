import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class realtime2 extends StatefulWidget {

  @override
  _realtime2State createState() => _realtime2State();
}

class _realtime2State extends State<realtime2> {
  GoogleMapController myController;

  Map<MarkerId,Marker> markers = <MarkerId,Marker>{};

  void initMarker(specify,specifyId) async{
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(specify['location'].latitude,specify['location'].longitude),
        infoWindow: InfoWindow(
            title: 'My location',snippet: specify['name']
        )
    );
    setState(() {
      markers[markerId] = marker;
    },);
  }


  getMarkerData() async{
    FirebaseFirestore.instance.collection('alarms').get().then((myMockData){
      if(myMockData.docs.isNotEmpty){
        for(int i=0;i<myMockData.docs.length;i++){
          initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);

        }
      }
    },);
  }

  void initState(){
    getMarkerData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker(){
      return <Marker>[
        Marker(
            markerId: MarkerId('maram gadah'),
            position: LatLng(21.543333, 39.172779),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
                title: ('my place')
            ),
        ),
      ].toSet() ;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 213, 152),
        title: Text(translator.translate('map'),textAlign: TextAlign.center,),

      ),
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(21.543333, 39.172779),
          zoom: 20.0,
        ),
        onMapCreated: (GoogleMapController controller){
          myController = controller;
        },
      ),
    );
  }
}
