import 'package:flutter/material.dart';

class MyAppBar {
  Widget build() {
    return AppBar(
      // leading: Icon(Icons.menu),
      title: Text(
        "Flutter Complete Demo",
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
      elevation: 10,
      backgroundColor: Colors.lightBlue,
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: Icon(Icons.more_vert),
      //   ),
      // ],
    );
  }
}
