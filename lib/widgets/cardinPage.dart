import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utilities/themeStyles.dart';

class CardInPage extends StatefulWidget {
    final String title;
  final String subTitle;
  final String price;
  final String letter;
  final Color color;
  CardInPage({
    required this.color,
    required this.letter,
    required this.price,
    required this.subTitle,
    required this.title,
});
  //const CardInPage({super.key});

  @override
  State<CardInPage> createState() => _CardInPageState();
}

class _CardInPageState extends State<CardInPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
            height: 62.0,
            width: 343.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 44.0,
                          width: 44.0,
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(22.0)
                          ),
                          child: Center(
                            child: Text(
                              widget.letter,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        
                      SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: ThemeStyles.otherDetailsPrimary),
                            Text(widget.subTitle, style: ThemeStyles.otherDetailsSecondary),
                        ],
                      )
                      ],
                      ),
                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(color: Colors.red),),
                        SizedBox(width: 4.0),
                        Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
              ],
            ),
            ],
          ),
          ),
    );
  }
}