import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_syngo/clothes.dart';
import 'package:in_syngo/electronics.dart';
import 'package:in_syngo/food.dart';
import 'package:in_syngo/medicines.dart';
import 'package:in_syngo/stationary.dart';
import 'package:in_syngo/toys.dart';

class HomeCard extends StatelessWidget {
  final int id;
  final String title;
  final String imagepath;

  HomeCard(this.id, this.title, this.imagepath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationFunction(id, context);
      },
      child: Card(
        color: Colors.yellow,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
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

void NavigationFunction(int id, BuildContext context) {
  if (id == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => medicines()),
    );
  } else if (id == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => clothes()),
    );
  } else if (id == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => toys()),
    );
  } else if (id == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => stationary()),
    );
  } else if (id == 5) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => food()),
    );
  } else if (id == 6) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => electronics()),
    );
  }
}
