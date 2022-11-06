import 'package:dummy/database/readDatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(write());
}

class write extends StatefulWidget {
  @override
  _writeState createState() => _writeState();
}

class _writeState extends State<write> {
  final _form = GlobalKey<FormState>();
  late String title;
  void writeData() async {
    _form.currentState!.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url =
        "https://seeker-44e86-default-rtdb.asia-southeast1.firebasedatabase.app/" +
            "data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RealTime Database',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("GeeksforGeeks"),
          ),
          body: Form(
            key: _form,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter Title"),
                    onSaved: (value) {
                      title = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: writeData,
                      //backgroundColor: Colors.green,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
          floatingActionButton:
              FloatingActionButton(onPressed: () => Get.to(read))),
    );
  }
}
