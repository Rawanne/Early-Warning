import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:training_project/confirm.dart';
import 'package:training_project/loading.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _fullnamecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();

  //bool _isbackon = false;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _fullnamecontroller.dispose();
    _confirmpassword.dispose();
    _phonecontroller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child:
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child:
                          Padding(
                        padding: EdgeInsets.only(right: 20, left: 10, top: 25),
                        child: IconButton(
                          icon: new Icon(Icons.arrow_back,
                              color: const Color(0xED000000), size: 30),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    //),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          translator.translate('createAccount'),
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: TextFormField(
                                //textAlign: TextAlign.right,
                                controller: _fullnamecontroller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: (translator.translate('fullName')),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return translator
                                        .translate('enterFullName');
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Container(
                              child: TextFormField(
                                controller: _passwordcontroller,
                                obscureText: true,
                                //textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: (translator.translate('password')),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return translator.translate('enterPass');
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Container(
                              child: TextFormField(
                                controller: _confirmpassword,
                                obscureText: true,
                                //textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText:
                                      (translator.translate('confirmPass')),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return translator.translate('enterPass');
                                  }
                                  if (_passwordcontroller.text !=
                                      _confirmpassword.text) {
                                    return translator.translate('passNotSim');
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Container(
                              child: TextFormField(
                                //textAlign: TextAlign.right,
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: translator.translate('email'),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return translator.translate('enterEmail');
                                  }
                                  if (!RegExp("^[a-zA-Z0-9+_.-]+@kau.edu.sa")
                                      .hasMatch(value)) {
                                    return translator.translate('emailWrong');
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Container(
                              child: TextFormField(
                                controller: _phonecontroller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: (translator.translate('phone')),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return translator.translate('enterPhone');
                                  }
                                  if (value.length < 9) {
                                    return translator.translate('wrongPhone');
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    child: Text(
                                      translator.translate('register'),
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: 'Tajawal'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 61, 213, 152),
                                      onPrimary: Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formkey.currentState.validate()) {
                                        setState(
                                          () {
                                            loading = true;
                                          },
                                        );

                                        try {
                                          final result = await FirebaseAuth
                                              .instance
                                              .createUserWithEmailAndPassword(
                                                  email: _emailcontroller.text,
                                                  password:
                                                      _passwordcontroller.text);

                                          if (result != null) {
                                            var userInfo = FirebaseFirestore
                                                .instance
                                                .collection('security')
                                                .doc(result.user.uid)
                                                .set(
                                              {
                                                'fullname':
                                                    _fullnamecontroller.text,
                                                'phone': _phonecontroller.text,
                                                'email': _emailcontroller.text,
                                              },
                                            );
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => confirm(),
                                              ),
                                            );
                                          }
                                        } catch (e) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(translator
                                                    .translate('emailUsed')),
                                                actions: [
                                                  FlatButton(
                                                    child: Text(translator
                                                        .translate('ok')),
                                                    onPressed: () {
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          setState(
                                            () {
                                              loading = false;
                                            },
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1000,
                      child: Image.asset('lib/img/dd.JPG'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
