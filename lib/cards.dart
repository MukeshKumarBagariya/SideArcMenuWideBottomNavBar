import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Cards extends StatefulWidget {

  final double latitude;
  final double longitude;
  final int speed;
  final String location;
  const Cards({Key key, this.latitude, this.longitude, this.speed, this.location}) : super(key: key);

  @override
  _CardsState createState() => _CardsState(latitude, longitude);
}

class _CardsState extends State<Cards> {
  double latitude;
  double longitude;

  _CardsState(this.latitude, this.longitude);

  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
        Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
                title: 'The title of the marker'
            )
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.black12,
        child: Row(
          children: [
            Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*(2/3),

                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width*(1/3)+100,  // or use fixed size like 200
                      height: MediaQuery.of(context).size.height/3-100,
                      child: GoogleMap(
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(target: LatLng(widget.latitude, widget.longitude), zoom: 13),
                        markers: Set<Marker>.of(_markers),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      )
                  )
                ])
          ],
        )
      ),
    );
  }
}