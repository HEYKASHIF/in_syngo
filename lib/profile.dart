import 'package:flutter/material.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  profileState createState() => profileState();
}

// ignore: camel_case_types
class profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
      ),
    );
  }
}
