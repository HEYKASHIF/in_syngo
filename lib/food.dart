import 'package:flutter/material.dart';

// ignore: camel_case_types
class food extends StatefulWidget {
  const food({super.key});

  @override
  foodState createState() => foodState();
}

// ignore: camel_case_types
class foodState extends State<food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FOOD"),
      ),
    );
  }
}
