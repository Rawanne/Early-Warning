import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class waiting extends StatefulWidget {
  @override
  _waitingState createState() => _waitingState();
}

class _waitingState extends State<waiting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/HBG1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          width: 156,
                          height: 156,
                          margin: EdgeInsets.only(top: 160),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                'lib/img/waitforhelp.png',
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 350),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  translator.translate('waiting'),
                                  style: TextStyle(
                                      fontSize: 25,
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
                    Column(
                      children: <Widget>[
                        SizedBox(height: 170),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 61, 213, 152),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text(
                                translator.translate('backHome'),
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Tajawal'),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 61, 213, 152),
                                onPrimary: Colors.white,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
