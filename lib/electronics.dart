import 'package:flutter/material.dart';

class electronics extends StatefulWidget {
  const electronics({super.key});
  @override
  electronicsState createState() => electronicsState();
}

class electronicsState extends State<electronics> {
  @override
  Widget build(BuildContext context) {
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
