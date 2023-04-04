import 'package:flutter/material.dart';

// ignore: camel_case_types
class clothes extends StatefulWidget {
  const clothes({super.key});

  @override
  clothesState createState() => clothesState();
}

// ignore: camel_case_types
class clothesState extends State<clothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CLOTHES"),
      ),
    );
  }
}
