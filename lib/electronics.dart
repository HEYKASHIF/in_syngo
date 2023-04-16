import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class electronics extends StatefulWidget {
  const electronics({super.key});
  @override
  electronicsState createState() => electronicsState();
}

class electronicsState extends State<electronics> {
  File? image;
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
        title: const Text("ELECTRONICS"),
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
                labelText: 'item name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'how old is this',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'product cost approximately',
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
          ))
        ],
      ),
    );
  }
}
