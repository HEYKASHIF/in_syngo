import 'package:flutter/material.dart';
import 'package:in_syngo/sample.dart';

// ignore: camel_case_types
class medicine extends StatefulWidget {
  final SampleModal data;

  const medicine(this.data, {super.key});

  @override
  medicineState createState() => medicineState(this.data);
}

// ignore: camel_case_types
class medicineState extends State<medicine> {
  final SampleModal data;

  medicineState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MEDICINE"),
      ),
      body: Image.asset(data.imagepath),

    );
  }
}
