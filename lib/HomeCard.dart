import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_syngo/clothes.dart';
import 'package:in_syngo/electronics.dart';
import 'package:in_syngo/food.dart';
import 'package:in_syngo/medicines.dart';
import 'package:in_syngo/stationary.dart';
import 'package:in_syngo/toys.dart';

import 'ListOfNgo.dart';

class HomeCard extends StatelessWidget {
  final int cat_id;
  final String title;
  final String imagepath;

  HomeCard(this.cat_id, this.title, this.imagepath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationFunction(cat_id, context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.yellow,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (Platform.isAndroid)
                        ? Image.asset(
                            imagepath,
                            height: 20,
                            width: 20,
                            fit: BoxFit.fill,
                          )
                        : Container(),
                    Text(
                      title,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void NavigationFunction(int cat_id, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListOfNgo(cat_id)),
    );

}
