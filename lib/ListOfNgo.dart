import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_syngo/stationary.dart';
import 'package:in_syngo/toys.dart';

import 'clothes.dart';
import 'electronics.dart';
import 'food.dart';
import 'medicines.dart';

class ListOfNgo extends StatefulWidget {
  final int cat_id;
  const ListOfNgo(this.cat_id, {super.key});

  @override
  ListOfNgoState createState() => ListOfNgoState(this.cat_id);
}

class ListOfNgoState extends State<ListOfNgo> {
  final int cat_id;

  late List data;

  ListOfNgoState(this.cat_id);

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/ngo_data.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  NavigationScreen(int ngo_id) {
    if (cat_id == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => medicines(
                  ngo_id: ngo_id,
                )),
      );
    } else if (cat_id == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => clothes(
                  ngo_id: ngo_id,
                )),
      );
    } else if (cat_id == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => toys(
                  ngo_id: ngo_id,
                )),
      );
    } else if (cat_id == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => stationary(
                  ngo_id: ngo_id,
                )),
      );
    } else if (cat_id == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => food(
                  ngo_id: ngo_id,
                )),
      );
    } else if (cat_id == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => electronics(
                  ngo_id: ngo_id,
                )),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text("LIST OF NGO"),
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              var name = data[index]['ngo_name'];
              var ngo_logo = data[index]['ngo_logo'];
              var email = data[index]['website'];
              var ngo_id = data[index]['ngo_id'];

              return (data[index]['cat_id'] == cat_id)
                  ? Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            NavigationScreen(ngo_id);
                          },
                          child: new ListTile(
                            leading: CircleAvatar(
                              child: new Image.network(ngo_logo),
                            ),
                            title: Text(name),
                            subtitle: Text(email),
                          ),
                        )
                      ],
                    )
                  : Container();
            }));
  }
}
