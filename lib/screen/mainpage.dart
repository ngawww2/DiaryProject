import 'package:flutter/material.dart';

// ignore: camel_case_types
class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

// ignore: camel_case_types
class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
