import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_syngo/colthModle.dart';
import 'package:in_syngo/sample.dart';

// ignore: camel_case_types
class clothes extends StatefulWidget {
  final int ngo_id;
  const clothes({super.key, required this.ngo_id});

  @override
  clothesState createState() => clothesState(this.ngo_id);
}

// ignore: camel_case_types
class clothesState extends State<clothes> {
  File? image;
  final int ngo_id;
  clothesState(this.ngo_id);
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
  final genderController = TextEditingController();
  final sizeController = TextEditingController();
  final pairController = TextEditingController();

  sendData() {
    final databaseReference = FirebaseDatabase.instance.ref("clothes");

    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    final Cloth = clothModle(
        '${nameController.text}',
        '${genderController.text}',
        double.parse('${sizeController.text}'),
        int.parse('${pairController.text}'),
        '$base64Image');

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);

    databaseReference.child(formattedDate).set({
      "ngo_id": ngo_id.toString(),
      "status": "Request Submit",
      'name': Cloth.name,
      'gender': Cloth.gender,
      'size': Cloth.size,
      'pair': Cloth.pair,
      'image': Cloth.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("CLOTHES"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
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
                labelText: 'your Name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: genderController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Gender',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: sizeController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'size',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: pairController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'pairs',
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      (image != null)
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(8, 75, 8, 8),
                              child: Container(
                                child: Image.file(
                                  image!,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(8, 75, 8, 8),
                              child: Container(
                                child: Image.asset(
                                  'assets/icon/icon.png',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: sendData,
                          child: Text('SUBMIT'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageCamera,
                          child: Text(
                            "UPLOAD IMAGE BY CAMERA",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageGallery,
                          child: Text("UPLOAD IMAGE BY GALLERY"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
