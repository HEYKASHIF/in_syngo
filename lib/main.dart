import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_syngo/login_screen.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCu0PaXZRhk6bE9hcpTDgmOoR4M9yXz07I",
          appId: "1:360523909722:android:d97949c1930a832845e663",
          messagingSenderId: "360523909722",
          projectId: "insyngo-142fa"));
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
            splashIconSize: 1000,
            duration: 3000,
            splash: Image.asset("assets/spl.jpg", height: 500, width: 500),
            nextScreen: TestScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blueGrey),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'SERVE SMILE',
      subTitle: 'we are together',
      imageUrl: 'assets/P2.png',
    ),
    Introduction(
      title: 'SPREAD SMILE',
      subTitle: 'everyone needs helps',
      imageUrl: 'assets/P3.png',
    ),
    Introduction(
      title: 'EARN SMILE',
      subTitle: 'we are here to help',
      imageUrl: 'assets/P4.png',
    ),
    Introduction(
      title: 'LIVE WITH SMILE',
      subTitle: 'we are trying to help everyone',
      imageUrl: 'assets/P5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final bool? is_login = prefs.getBool('is_login');

        if (is_login == false) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ), //MaterialPageRoute
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ), //MaterialPageRoute
          );
        }
      },
    );
  }
}
