import 'package:in_syngo/utilities/themeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeStyles{
  static TextStyle primaryTitle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: ThemeColors.black,

  );
  static TextStyle seeAll = TextStyle(
    fontSize: 17.0,
    color: ThemeColors.black,
  );
  static TextStyle cardDetail = TextStyle(
    fontSize: 17.0,
    color: Color.fromARGB(255, 6, 0, 12),
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardMoney = TextStyle(
    color: Colors.white,
    fontSize : 22.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle tagText = TextStyle(
    fontStyle: FontStyle.italic,
    color: ThemeColors.black,
    fontWeight: FontWeight.w500,

  );
  static TextStyle otherDetailsPrimary = TextStyle(
    fontSize: 16.0,
    color: ThemeColors.black,

  );
  static TextStyle otherDetailsSecondary = TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );
}