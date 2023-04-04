import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu),
        title: Text("HOME"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/icon/icon.png"),),
          )
        ],
      ),
          body: Container(


          ),
    );
  }
}