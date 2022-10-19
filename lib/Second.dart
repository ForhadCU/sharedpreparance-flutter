import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  late String str = "Strin..";
  late String i = "Integer..";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Second',
      )),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                str,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                i,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
    ),
      ),
    );
  }
}
