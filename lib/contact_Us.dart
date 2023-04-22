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
              subtitle: Text('Anytown, USA 12345'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('(123) 456-7890'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('info@company.com'),
            ),
          ],
        ),
      ),
    );
  }
}
