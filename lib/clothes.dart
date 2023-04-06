import 'package:flutter/material.dart';
import 'package:in_syngo/sample.dart';

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
    final data = ModalRoute.of(context)!.settings.arguments as SampleModal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CLOTHES"),
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
