//import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:in_syngo/Homepage.dart';
import 'package:in_syngo/Signup_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:in_syngo/my_home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<UserCredential> signInWithGoogle() async {
    Firebase.initializeApp();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var result = (await FirebaseAuth.instance.signInWithCredential(credential));
    var _user = result.user;

    // UserCredential userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    // final userName = userCredential.additionalUserInfo!.username;
    // print(userCredential.additionalUserInfo!);

    if (credential != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_login', true);
    }

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.all(50),
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
                "Login",
                style: TextStyle(
                    fontFamily: 'mag',
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PHONE NUMBER',
                      icon: Icon(Icons.phone_android)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
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
                padding: EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final databaseReference =
                        FirebaseDatabase.instance.ref("USER");
                    final snapshot = await databaseReference
                        .child('${numberController.text}')
                        .get();
                    if (snapshot.exists) {
                      print(snapshot.value);
                      String password = (snapshot.value as Map)["password"];

                      if (password == passwordController.text) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: "WRONG PASSSWORD",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color.fromARGB(255, 236, 26, 11),
                            textColor: Color.fromARGB(255, 4, 4, 4),
                            fontSize: 16.0);
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "USER NOT EXIST",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 236, 26, 11),
                          textColor: Color.fromARGB(255, 4, 4, 4),
                          fontSize: 16.0);
                    }
                  },
                  icon: Icon(Icons.email),
                  label: Text(
                    "          SUBMIT              ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ElevatedButton.icon(
                onPressed: () {
                  signInWithGoogle();
                },
                icon: Icon(Icons.mail),
                label: Text(
                  "LOGIN WITH GOOGLE",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
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
