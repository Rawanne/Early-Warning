import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Container(
            color: Colors.white,
            child: Center(
              child: SpinKitWave(
                color: Color.fromARGB(255, 61, 213, 152),
                size: 90.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}