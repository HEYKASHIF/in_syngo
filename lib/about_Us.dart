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
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Name and Logo
            Container(
              // width: screenWidth,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icon/icon.png'),
                    radius: 60,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'In_Syngo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),

            //brief summary
            Container(
                // width: screenWidth,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MISSION STATEMENT:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Our company offers a wide range of high-quality products and services to meet the needs of our customers.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),

            //statement and values
            Container(
                // width: screenWidth,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MISSION STATEMENT:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Our mission is to provide high-quality products and services to our customers.',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'OUR VALUES:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('Donation satisfaction is our top priority'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('We strive for continuous improvement'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text(
                          'We value honesty and integrity in all our actions'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
