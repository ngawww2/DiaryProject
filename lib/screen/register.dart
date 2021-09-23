import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/profile.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 19),
                    child: Center(
                      child: Container(
                          width: 280,
                          height: 180,
                          /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset('assets/images/logo.png')),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'please enter Email'),
                                  EmailValidator(
                                      errorText: 'Type Email is not correct')
                                ]),
                                onSaved: (String email) {
                                  profile.email = email;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: 'abc@gmail.com',
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 20)),
                              TextFormField(
                                validator: RequiredValidator(
                                    errorText: 'please enter password'),
                                onSaved: (String password) {
                                  profile.password = password;
                                },
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: 'Enter your password',
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              )
                            ],
                          ))),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.blue),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: profile.email,
                                    password: profile.password);
                            print(profile.email);
                          } on FirebaseAuthException catch (e) {
                            print(e.message);
                          }
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.blue, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0)),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Image.asset('assets/images/background.png'),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
