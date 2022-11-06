// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   LocationData? locationData;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Center(
//         child:
//             Text(locationData != null ? locationData!.latitude.toString() : ""),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: _determinePosition),
//     ));
//   }
// }

// void _determinePosition() async {
//   Location location = Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   LocationData _locationData;

//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       return;
//     }
//   }

//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return;
//     }
//   }

//   _locationData = await location.getLocation();
// }
