import 'package:flutter/material.dart';

class about_Us extends StatefulWidget {
  const about_Us({super.key});

  @override
  State<about_Us> createState() => _about_UsState();
}

class _about_UsState extends State<about_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABOUT US'),
      ),
    );
  }
}
