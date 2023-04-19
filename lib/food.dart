import 'dart:io';

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
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'your Name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'weight of the food',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'how many people it can serve',
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                (image != null)
                    ? Expanded(
                        child: Container(
                          child: Image.file(image!),
                          height: 100,
                          width: 100,
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
                        padding: EdgeInsets.fromLTRB(20, 70, 20, 70),
                        child: ElevatedButton(
                          onPressed: pickImageCamera,
                          child: Text('UPLOAD IMAGE BY CAMERA'),
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
              onPressed: null,
              child: Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }
}
