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
        backgroundColor: Color.fromARGB(255, 180, 19, 7),
        title: const Text("PROFILE"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/5.JPG'),
                  radius: 75,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              // padding: const EdgeInsets.fromLTRB(0, 50, 200, 10),
              child: Text(
                'MOHD KASHIF',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              // padding: const EdgeInsets.fromLTRB(0, 50, 200, 10),
              child: Text(
                'E-MAIL ID',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              // padding: const EdgeInsets.fromLTRB(0, 50, 200, 10),
              child: Text(
                'GENDER',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              // padding: const EdgeInsets.fromLTRB(0, 50, 200, 10),
              child: Text(
                'PHONE NUMBER',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              // padding: const EdgeInsets.fromLTRB(0, 50, 200, 10),
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
      ),
    );
  }
}
