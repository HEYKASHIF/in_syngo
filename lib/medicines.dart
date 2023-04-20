import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_syngo/mediModle.dart';
import 'package:in_syngo/sample.dart';

// ignore: camel_case_types
class medicines extends StatefulWidget {
  final int ngo_id;
  const medicines({super.key, required this.ngo_id});

  @override
  medicineState createState() => medicineState(this.ngo_id);
}

// ignore: camel_case_types
class medicineState extends State<medicines> {
  File? image;
  final int ngo_id;
  medicineState(this.ngo_id);
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
  final mediNameController = TextEditingController();
  final dateController = TextEditingController();
  final no_of_tabletsController = TextEditingController();

  sendData() {
    final databaseReference = FirebaseDatabase.instance.ref("medicines");

    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    final medi = mediModle(
        '${nameController.text}',
        '${mediNameController.text}',
        '${dateController.text}',
        int.parse('${no_of_tabletsController.text}'),
        '$base64Image');

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);

    databaseReference.child(formattedDate).set({
      "ngo_id": ngo_id.toString(),
      "status": "Request Submit",
      'name': medi.name,
      'mediName': medi.mediName,
      'date': medi.date,
      'no_of_tablets': medi.no_of_tablets,
      'image': medi.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("MEDICINES"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icon/icon.png'),
              // radius: 50,
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
              controller: mediNameController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Medicine Name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: dateController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Manufacturing Date/Expiry Date',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: no_of_tabletsController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantity of tablets',
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
                        ),
                      )
                    : Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/icon/icon.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageCamera,
                          child: Text(
                            "UPLOAD IMAGE BY CAMERA",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageGallery,
                          child: Text("UPLOAD IMAGE BY GALLERY"),
                        ),
                      ),
                    ),
                  ],
                ),
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
