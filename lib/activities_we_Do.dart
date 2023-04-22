import 'package:flutter/material.dart';

class activities extends StatefulWidget {
  const activities({super.key});

  @override
  State<activities> createState() => _activitiesState();
}

class _activitiesState extends State<activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETTINGS'),
      ),
    );
  }
}
