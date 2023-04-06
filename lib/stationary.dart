import 'package:flutter/material.dart';

// ignore: camel_case_types
class stationary extends StatefulWidget {
  const stationary({super.key});

  @override
  stationaryState createState() => stationaryState();
}

// ignore: camel_case_types
class stationaryState extends State<stationary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STATIONARIES"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          )
        ],
      ),
    );
  }
}
