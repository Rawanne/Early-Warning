import 'package:flutter/material.dart';
import 'generalHome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'setting.dart';

class nav extends StatefulWidget {
  @override
  _navState createState() => _navState();
}

class _navState extends State<nav> {
  int _page = 0;
  final _pageOption = [
    generalHome(),
    setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Color.fromARGB(255, 61, 213, 152),
        items: [
          Icon(Icons.home, size: 30),
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
