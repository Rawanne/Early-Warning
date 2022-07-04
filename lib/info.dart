import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  bool _isbackon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/img/new1.png"),
                fit: BoxFit.fill,
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
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          translator.translate('appInfo'),
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontFamily: 'Tajawal'),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset('lib/img/info.png'),
                      ),
                    ),
                    SizedBox(height: 130),
                    Container(
                      child: Text(
                        translator.translate('appInfo2'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tajawal'),
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 350,
                        height: 210,
                        child: Image.asset('lib/img/kau.JPG'),
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
