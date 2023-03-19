import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:in_syngo/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Container(
        height: 200,
        width: double.infinity,
        // child:
        //
        // Stack(
        //   children: [
        //     Image.asset("assets/spl.jpg",fit: BoxFit.fitHeight,),
        //     const Center(
        //       child:
        //       Text("In syngo",style: TextStyle(color: Colors.white,fontSize: 24,decoration: TextDecoration.none),)
        //     )
        //   ],
        // ),
        //

        child: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset("assets/spl.jpg", height: 500, width: 500),
            nextScreen: LoginScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blueGrey),
      ),
    );
  }
}
