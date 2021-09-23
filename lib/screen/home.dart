import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class Homepage extends StatefulWidget {
  @override
  _hompageState createState() => _hompageState();
}

class _hompageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 280,
                    height: 180,
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => loginpage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0)),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.blue),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Register()));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 181),
              child: Center(
                child: Image.asset('assets/images/background.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
