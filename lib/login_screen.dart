//import 'dart:ffi';
import 'package:in_syngo/Signup_Screen.dart';
import 'package:flutter/material.dart';
//import 'package:in_syngo/my_home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "LOGIN",
                style: TextStyle(
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
                      labelText: 'USER ID',
                      icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      icon: Icon(Icons.password)),
                ),
              ),

              // ElevatedButton(onPressed: null, child: Text("LOGIN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
              // ),

              Container(
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  icon: Icon(Icons.email),
                  label: Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ElevatedButton.icon(
                onPressed: null,
                icon: Icon(Icons.phone_android),
                label: Text(
                  "LOGIN WITH OTP",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),

              // ElevatedButton.icon(onPressed: null,
              //     icon: Icon(Icons.facebook,
              //     ),
              //     label: Text(
              //   "LOGIN WITH FACEBOOK",
              //   style: TextStyle(
              //       color: Colors.black, fontWeight: FontWeight.bold,
              //   ),
              // ),
              // ),
              //

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
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
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
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                icon: const Icon(
                  Icons.verified_user_rounded,
                ),
                label: Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
