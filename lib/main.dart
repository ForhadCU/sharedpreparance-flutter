import 'package:flutter/material.dart';
import 'package:flutter_app_sharedpreparance/Second.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String str = "";
  late String i = "";
  TextEditingController _stringController = TextEditingController();
  TextEditingController _intController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stringController.addListener(() {
      setState(() {
        str = _stringController.text;
      });
    });
  }


  void _mSaveData() async{
    str = _stringController.text;
    i = _intController.text;
    if (str.isNotEmpty && i.isNotEmpty)
      {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("str", str);
        sharedPreferences.setString("i", i);

        //go to Second.dart
        Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));
      }
    else{
      Fluttertoast.showToast(
          msg: "Empty",
          toastLength: Toast.LENGTH_SHORT);
    }

    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter String here..',
                  labelText: 'String'),
              keyboardType: TextInputType.text,
              controller: _stringController,

            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter int here...',
                    labelText: 'Int'),
                keyboardType: TextInputType.number,
                controller: _intController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: _mSaveData,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(100)),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
            child: Text(
              str + " "+ i,
              style: TextStyle(fontSize: 20),
            ),)
          ],
        ),
      ),
    );
  }
}
