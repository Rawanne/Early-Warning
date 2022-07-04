import 'package:flutter/material.dart';
import 'selectHelp.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class generalHome extends StatefulWidget {
  @override
  _generalHomeState createState() => _generalHomeState();
}

class _generalHomeState extends State<generalHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ClipOval(
            child: InkWell(
              child: Container(
                width: 290.0,
                height: 290.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset('lib/img/help.png'),
                    Text(
                      translator.translate('help'),
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => selectHelp(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
