import 'dart:async';
import 'dart:io' show Platform;

import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:dummy/bindings/location_binding.dart';
import 'package:dummy/database/writeDatabase.dart';
import 'package:dummy/screens/add_device.dart';
import 'package:dummy/screens/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

/// Defines the main theme color.\
final MaterialColor themeMaterialColor =
    BaseflowPluginExample.createMaterialColor(
        const Color.fromRGBO(48, 49, 60, 1));

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GeolocatorWidget());
  //runApp(addDevice());
}

class quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialBinding: locationBinding(), home: addDevice());
  }
}

/// Example [Widget] showing the functionalities of the geolocator plugin
