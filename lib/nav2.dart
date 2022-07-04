import 'package:flutter/material.dart';
import 'securityHome.dart';
import 'securitySetting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'testAlarms.dart';

class nav2 extends StatefulWidget {
  @override
  _nav2State createState() => _nav2State();
}

class _nav2State extends State<nav2> {
  int _page = 0;
  final _pageOption = [
    securityHome(),
    testAlarms(),
    securitySetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Color.fromARGB(255, 61, 213, 152),
        items: [
          Icon(Icons.home, size: 30),
          Icon(
            Icons.notification_important,
            size: 30,
          ),
          Icon(Icons.settings, size: 30),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(
            () {
              _page = index;
            },
          );
        },
      ),
      body: _pageOption[_page],
    );
  }
}
