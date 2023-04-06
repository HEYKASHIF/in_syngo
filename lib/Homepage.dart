import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_syngo/HomeCard.dart';
import 'package:in_syngo/sample.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  final List<SampleModal> CategoryList =[
    SampleModal(1, "Medicines", "assets/icon/medicine.png"),
    SampleModal(2, "Clothes", "assets/icon/cloth.png"),
    SampleModal(3, "Toy", "assets/icon/toy.png"),
    SampleModal(4, "Book", "assets/icon/book.png"),
    SampleModal(5, "Electronic", "assets/icon/electronic.png"),
    SampleModal(6, "Food", "assets/icon/food.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
          body:
                // ListView.builder(
                //     itemCount: CategoryList.length,
                //     itemBuilder: (context,index){
                //   return HomeCard(CategoryList[index].id, CategoryList[index].title, CategoryList[index].imagepath);
                // }

            GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: CategoryList.length,
            itemBuilder: (BuildContext context,int index) {
              return HomeCard(CategoryList[index].id, CategoryList[index].title,
                  CategoryList[index].imagepath);
            } )
          );
  }
}