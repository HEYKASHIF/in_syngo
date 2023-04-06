import 'package:flutter/material.dart';
import 'package:in_syngo/HomeCard.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
              backgroundImage: AssetImage("assets/icon/icon.png"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCard(1, "Medicines", "assets/icon/medicine.png"),
            HomeCard(2, "Clothes", "assets/icon/cloth.png"),
            HomeCard(3, "Toys", "assets/icon/toy.png"),
            HomeCard(4, "Stationary", "assets/icon/book.png"),
            HomeCard(5, "Food", "assets/icon/food.png"),
            HomeCard(6, "Electronics", "assets/icon/electronic.png"),
          ],
        ),
      ),
    );
  }
}
