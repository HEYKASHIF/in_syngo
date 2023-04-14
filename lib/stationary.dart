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
        backgroundColor: Colors.blue,
        title: const Text("STATIONARIES"),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/icon/icon.png'),
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
                labelText: 'Your Name please',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Stationary Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantatity of Item',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cost of Item Approximately',
              ),
            ),
          )
        ],
      ),
    );
  }
}
