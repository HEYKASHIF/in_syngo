import 'package:flutter/material.dart';

// ignore: camel_case_types
class toys extends StatefulWidget {
  const toys({super.key});

  @override
  toysState createState() => toysState();
}

// ignore: camel_case_types
class toysState extends State<toys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOYS"),
      ),
    );
  }
}
