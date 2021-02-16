import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';




class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
 class _MyAppState extends State<MyApp> {
  
   
   
   GoogleMapController mapController;
   final LatLng _center = const LatLng(45.521563, -122.677433);

   void _onMapCreated(GoogleMapController controller) {
     mapController = controller;
   }
   @override
   // TODO: implement widget
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
       /*appBar: AppBar(
          title: Text('venues'),
          actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.settings,
                size:30,
                color: Colors.white,
      ),
      onPressed: () {
          
      },
    ),
  ],
        ),*/
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom:11,
            ),
            
      ),
    ),
    );
    
  }
 }


 