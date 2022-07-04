import 'package:flutter/material.dart';
import 'package:training_project/loading.dart';
import 'package:training_project/nav2.dart';
import 'package:training_project/signup.dart';
import 'signup.dart';
import 'nav2.dart';
import 'resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
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
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding:
                                EdgeInsets.only(right: 20, left: 10, top: 25),
                            child: IconButton(
                              icon: new Icon(Icons.arrow_back,
                                  color: const Color(0xED000000), size: 30),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 100, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  translator.translate('signin'),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Tajawal',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            //textAlign: TextAlign.right,
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: (translator.translate('email')),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return (translator.translate('enterEmail'));
                              }
                            },
                          ),
                          SizedBox(height: 35),
                          TextFormField(
                            //textAlign: TextAlign.right,
                            obscureText: true,
                            controller: _passwordcontroller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: (translator.translate('password')),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return (translator.translate('enterPass'));
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            child: Center(
                              child: Container(
                                child: Text(
                                  translator.translate('forgetPass'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Tajawal',
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => resetPassword(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 35),
                          Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    child: Text(
                                      translator.translate('signin'),
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
                                        _formkey.currentState.save();
                                        try {
                                          print(_emailcontroller);
                                          final User user = (await FirebaseAuth
                                                  .instance
                                                  .signInWithEmailAndPassword(
                                                      email:
                                                          _emailcontroller.text,
                                                      password:
                                                          _passwordcontroller
                                                              .text))
                                              .user;
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => nav2(),
                                            ),
                                          );
                                        } catch (e) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(translator
                                                    .translate('userNotFound')),
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
                          SizedBox(height: 35),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                translator.translate('haveAccount'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Tajawal',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 35),
                          Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    child: Text(
                                      translator.translate('createAccount'),
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
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => signup(),
                                        ),
                                      );
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
