import 'package:flutter/material.dart';

// ignore: camel_case_types
class medicine extends StatefulWidget {
  const medicine({super.key});

  @override
  medicineState createState() => medicineState();
}

// ignore: camel_case_types
class medicineState extends State<medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MEDICINE"),
      ),
    );
  }
}
