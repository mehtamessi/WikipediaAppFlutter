import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ui/wikipedia_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikipedia App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String title;
  String searchKey = "No Value Entered";

  void _setText() {
    setState(() async {
      if(title!=null) {
        searchKey = title;
        if(searchKey!="No Value Entered"&&searchKey.isNotEmpty){

          try {
            final result = await InternetAddress.lookup('google.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              print('connected');

              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WikipediaScreen(searchKey: searchKey)));
            }
          } on SocketException catch (_) {
            _toastmessage(
                "Please check internet connection!");
          }
          }
        else{
          _toastmessage(
              "Please enter search value!");
        }
         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => WikipediaScreen(searchKey: searchKey)));

      }else{
        _toastmessage(
            "Please enter search value!");
      }

    });
  }
  void _toastmessage(String msg)
  {
    setState(() {
      Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        fontSize: 16.0,
        // textColor: Colors.pink
      );});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // body: WikipediaScreen(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(labelText: 'Search wikipedia'),

              onChanged: (value) => title = value,

            ),
          ),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
            onPressed: _setText,
            child: Text('Search'),
            elevation: 8,
            color: Colors.greenAccent,
            splashColor: Colors.yellow[200],

          ),
          SizedBox(
            height: 20,
          ),
          Text(searchKey),
          // changes in text
          // are shown here
        ],
      ),
    );
  }
}
