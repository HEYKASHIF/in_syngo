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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/prof.jpg'),
                radius: 75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 250, 10),
            child: Text(
              'MOHD KASHIF',
              style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 275, 10),
            child: Text(
              'E-MAIL ID',
              style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 300, 10),
            child: Text(
              'GENDER',
              style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 225, 10),
            child: Text(
              'PHONE NUMBER',
              style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 350, 10),
            child: Text(
              'AGE',
              style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
