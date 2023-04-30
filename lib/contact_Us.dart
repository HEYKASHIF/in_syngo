import 'package:flutter/material.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text('CONTACT US'),
      ),
      body: Container(
        // width: screenWidth,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('201206, TOWN MURADNAGAR'),
              subtitle: Text('DELHI NCR, INDIA'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('8126064785'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Kashifmohd269@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}
