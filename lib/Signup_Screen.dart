import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_syngo/Homepage.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/icon/icon.png')),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black,
                  ),
                ),
              ),

              Text(
                "Sign up",
                style: TextStyle(
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Create Password',
                      icon: Icon(Icons.password)),
                ),
              ),

              // ElevatedButton(onPressed: null, child: Text("LOGIN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
              // ),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(Icons.email),
                label: Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),

              //     ElevatedButton(
              //         onPressed: null,
              //         child: Text(
              //           "LOGIN WITH FACEBOOK",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         )
              // ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(top: 120),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),

                        // ElevatedButton(
                        //   Padding(padding: EdgeInsets.all(10
                        //   ),
                        //   child: Container(margin: EdgeInsets.only(top: 120),
                        //   alignment: Alignment.bottomCenter,
                        //   child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   crossAxisAlignment: CrossAxisAlignment.stretch,),),
                        //   )
                        //   onPressed: null,
                        //   child: Text(
                        //     "Register",
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 30),
                        //   ),
                        // ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
