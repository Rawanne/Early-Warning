import 'package:flutter/material.dart';
import 'resetPassMsg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_project/loading.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class resetPassword extends StatefulWidget {
  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  bool loading = false;

  TextEditingController _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/img/confirm1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
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
                          Center(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
                                child: Text(
                                  translator.translate('resetPass'),
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.black,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 200),
                          Center(
                            child: Container(
                              height: 70,
                              width: 370,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        //textAlign: TextAlign.right,
                                        controller: _emailcontroller,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          hintText:
                                              (translator.translate('email')),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 100),
                          Center(
                            child: Container(
                              width: 350,
                              height: 260,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      child: Text(
                                        translator.translate('resetPass'),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Tajawal'),
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
                                        dynamic result = FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email: _emailcontroller.text);
                                        setState(
                                          () {
                                            loading = true;
                                          },
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                resetPassMsg(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
