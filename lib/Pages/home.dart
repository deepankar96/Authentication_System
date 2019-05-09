import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _nameState createState() => _nameState();
}

class _nameState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Home'),
       ),
    );
  }
}