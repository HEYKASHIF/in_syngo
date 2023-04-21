import 'dart:convert';
import 'dart:io';
import 'package:in_syngo/foodModle.dart';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class food extends StatefulWidget {
  final int ngo_id;
  const food({super.key, required this.ngo_id});

  @override
  foodState createState() => foodState(this.ngo_id);
}

// ignore: camel_case_types
class foodState extends State<food> {
  File? image;
  final int ngo_id;
  foodState(this.ngo_id);
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
  final FoodNameController = TextEditingController();
  final weightController = TextEditingController();
  final servingsController = TextEditingController();

  sendData() {
    final databaseReference = FirebaseDatabase.instance.ref("food");

    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    final food = foodModle(
        '${nameController.text}',
        '${FoodNameController.text}',
        double.parse('${weightController.text}'),
        int.parse('${servingsController.text}'),
        '$base64Image');

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);

    databaseReference.child(formattedDate).set({
      "ngo_id": ngo_id.toString(),
      "status": "Request Submit",
      'name': food.name,
      'FoodName': food.FoodName,
      'weight': food.weight,
      'servings': food.servings,
      'image': food.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("FOOD"),
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
                labelText: 'your Name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: FoodNameController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Name',
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
                labelText: 'weight of the food',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: servingsController,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'how many people it can serve',
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
