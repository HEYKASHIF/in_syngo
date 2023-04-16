import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGOUT'),
      ),
    );
  }

  @override
  Future<void> initState() async {
    super.initState();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_login', false);

    // clear all the preferences
    // await prefs.clear();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }
}
