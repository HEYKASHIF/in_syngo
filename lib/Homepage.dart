import 'package:flutter/material.dart';
import 'package:in_syngo/HomeCard.dart';
import 'package:in_syngo/Status.dart';
import 'package:in_syngo/about_Us.dart';
import 'package:in_syngo/activities_we_Do.dart';
import 'package:in_syngo/contact_Us.dart';
import 'package:in_syngo/fAQ.dart';
import 'package:in_syngo/logOut.dart';
import 'package:in_syngo/profile.dart';
import 'package:in_syngo/sample.dart';
import 'package:in_syngo/terms_&_Conditions.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<SampleModal> CategoryList = [
    SampleModal(1, "Medicines", "assets/icon/medicine.png"),
    SampleModal(2, "Clothes", "assets/icon/cloth.png"),
    SampleModal(3, "Toys", "assets/icon/toy.png"),
    SampleModal(4, "Stationary", "assets/icon/book.png"),
    SampleModal(5, "Food", "assets/icon/food.png"),
    SampleModal(6, "Electronics", "assets/icon/electronic.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        'in_syngo',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Billabong',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        child: CircleAvatar(
                      backgroundImage: AssetImage('assets/icon/icon.png'),
                      radius: 50,
                    )),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("Profile"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.switch_account_sharp),
              title: Text("STATUS"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Status()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("FAQ"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQ()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("ABOUT US"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => about_Us()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_activity),
              title: Text("ACTIVITIES WE DO"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => activities()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("CONTACT US"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUS()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.label_important),
              title: Text("TERMS & CONDITIONS"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsConditions()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LOGOUT"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Logout()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "HOME",
          style: TextStyle(
              fontFamily: 'Billabong', fontSize: 30, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/icon/icon.png"),
            ),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: CategoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return HomeCard(CategoryList[index].cat_id, CategoryList[index].title,
              CategoryList[index].imagepath);
        },
      ),
    );
  }
}
