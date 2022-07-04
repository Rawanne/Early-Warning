import 'package:flutter/material.dart';
import 'package:training_project/login.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class resetPassMsg extends StatefulWidget {
  @override
  _resetPassMsgState createState() => _resetPassMsgState();
}

class _resetPassMsgState extends State<resetPassMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/img/msg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 330),
                    Container(
                      child: Text(
                        translator.translate('resetPass'),
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: Text(
                        translator.translate('resetMsg'),
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontFamily: 'Tajawal'),
                      ),
                    ),
                    SizedBox(height: 120),
                    Container(
                      width: 350,
                      height: 260,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text(
                                  translator.translate('ok'),
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: 'Tajawal'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 61, 213, 152),
                                  onPrimary: Colors.white,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
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
