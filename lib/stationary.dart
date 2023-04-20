import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_syngo/statModle.dart';

// ignore: camel_case_types
class stationary extends StatefulWidget {
  final int ngo_id;
  const stationary({super.key, required this.ngo_id});

  @override
  stationaryState createState() => stationaryState(this.ngo_id);
}

// ignore: camel_case_types
class stationaryState extends State<stationary> {
  File? image;
  final int ngo_id;
  stationaryState(this.ngo_id);
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final nameController = TextEditingController();
  final statNameController = TextEditingController();
  final weightController = TextEditingController();
  final costController = TextEditingController();

  sendData() {
    final databaseReference = FirebaseDatabase.instance.ref("stationary");

    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    final stat = statModle(
        '${nameController.text}',
        '${statNameController.text}',
        double.parse('${weightController.text}'),
        int.parse('${costController.text}'),
        '$base64Image');

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);

    databaseReference.child(formattedDate).set({
      "ngo_id": ngo_id.toString(),
      "status": "Request Submit",
      'name': stat.name,
      'statName': stat.statName,
      'weight': stat.weight,
      'cost': stat.cost,
      'image': stat.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("STATIONARIES"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icon/icon.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: nameController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: statNameController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Stationary Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: weightController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantatity of Item',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: costController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cost of Item Approximately',
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                (image != null)
                    ? Expanded(
                        child: Container(
                        child: Image.file(
                          image!,
                          height: 100,
                          width: 100,
                        ),
                      ))
                    : Expanded(
                        child: Container(
                          child: Image.asset('assets/icon/icon.png'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageCamera,
                          child: Text(
                            'UPLOAD IMAGE BY CAMERA',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageGallery,
                          child: Text('UPLOAD IMAGE BY GALLERY'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
              onPressed: sendData,
              child: Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }
}
