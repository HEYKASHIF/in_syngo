
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_syngo/clothes.dart';
import 'package:in_syngo/medicines.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCard extends StatelessWidget{
  final int id;
  final String title;
  final String imagepath;


  HomeCard(this.id, this.title, this.imagepath);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          NavigationFunction(id,context);
        },
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          child: Container(
            height: 100,
            width: 200,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    (Platform.isAndroid)
                    ?
                Image.asset(imagepath,height: 20,width: 20, fit: BoxFit.fill,)
                  :
                        Container(),


                    Text(title,style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
            ),
          ),

        ),
      );

  }



  void NavigationFunction(int id,BuildContext context) {
    if(id==1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => medicine()),
      );
    }

   else if(id==2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => clothes()),
      );
    }

   else if(id==3){
     _launchInBrowser(Uri.parse("https://www.google.com/"));
    }

    else if(id==4){
      _makePhoneCall("+919311966636");
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

}