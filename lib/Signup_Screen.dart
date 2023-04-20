import 'dart:ffi';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_syngo/Homepage.dart';
import 'package:in_syngo/signModle.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final numberController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  sendData() {
    final databaseReference = FirebaseDatabase.instance.ref("USER");

    // final bytes = File(image!.path).readAsBytesSync();
    // String base64Image = "data:image/png;base64," + base64Encode(bytes);

    final user = signModle(
      '${nameController.text}',
      '${genderController.text}',
      int.parse('${numberController.text}'),
      int.parse('${ageController.text}'),
      '${emailController.text}',
      '${passwordController.text}',
      // '$base64Image'
    );

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);

    databaseReference.child(formattedDate).set({
      // "ngo_id": ngo_id.toString(),
      "status": "Request Submit",
      'name': user.name,
      'gender': user.gender,
      'number': user.number,
      'age': user.age,
      'email': user.email,
      'password': user.password,
      // 'image': toy.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          //margin: EdgeInsets.all(50),
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
                    fontFamily: 'Billabong',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'NAME',
                      icon: Icon(Icons.password)),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'GENDER',
                      icon: Icon(Icons.password)),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PHONE NUMBER ',
                      icon: Icon(Icons.password)),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: ageController,
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'AGE',
                      icon: Icon(Icons.password)),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
                  // obscureText: true,
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
                  margin: EdgeInsets.only(top: 50),
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
                              "Already SignUp",
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
