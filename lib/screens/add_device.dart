import 'package:dummy/main.dart';
import 'package:dummy/screens/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' show Platform;
import '../controllers/locationController.dart';
import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:dummy/database/writeDatabase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

//final fb = FirebaseDatabase.instance;
final controller = Get.put(locationController());
//final ref = fb.ref().child('users');

class addDevice extends StatefulWidget {
  @override
  _addDeviceState createState() => _addDeviceState();
}

class _addDeviceState extends State<addDevice> {
  StreamSubscription<Position>? _positionStream;
  TextEditingController deviceName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(controller.email);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Enter the device name'),
          ),
          body: Column(
            children: [
              SizedBox(height: 40),
              TextField(
                  controller: deviceName,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Enter your device name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_to_drive_outlined),
            onPressed: () {
              print(deviceName.text);
              controller.device.value = deviceName.text;
              deviceName.clear();
              add();
              Get.snackbar(
                'Device name Set successfully',
                "Ready for tracking!!",
                icon: Icon(Icons.person, color: Colors.blue),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                borderRadius: 20,
                margin: EdgeInsets.all(10),
                colorText: Colors.white,
                duration: Duration(seconds: 4),
                isDismissible: true,
                dismissDirection: DismissDirection.horizontal,
                forwardAnimationCurve: Curves.easeOutBack,
              );
              //showSB();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GeolocatorWidget()),
              );
            },
          ),
        ),
      ),
    );
  }
}

void add() async {
  print(controller.email);
  print(controller.device);
  DatabaseReference ref1 = FirebaseDatabase.instance.ref("data");
  await ref1.set({
    "email": controller.email,
    "Device name": controller.device.value,
    "latitude": controller.latitude.value,
    "longitude": controller.longitude.value,
    //"location_list": controller.location_list
  });
}

void showSB() {}
