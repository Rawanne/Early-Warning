import 'package:flutter/material.dart';
import 'package:training_project/contactUs.dart';
import 'info.dart';
import 'login.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 249, 249, 10),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Text(
                    translator.translate('setting'),
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: Container(
                    height: 85.0,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    color: Colors.white,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          translator.translate('regesterAs'),
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 24,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.perm_identity,
                          size: 35,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 61, 213, 152),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right, size: 25),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 27.0,
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: Center(
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                translator.translate('aboutUs'),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 20,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                            leading: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.info,
                                size: 25,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 87, 95),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => info(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      new Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      Container(
                        height: 70,
                        child: Center(
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                translator.translate('translate'),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 20,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                            leading: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.language,
                                size: 25,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 60, 135, 255),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () {
                              translator.setNewLanguage(
                                context,
                                newLanguage: translator.currentLanguage == 'ar'
                                    ? 'en'
                                    : 'ar',
                                remember: true,
                                restart: true,
                              );
                            },
                          ),
                        ),
                      ),
                      new Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      Container(
                        height: 70,
                        child: Center(
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                translator.translate('contactUs'),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 20,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                            leading: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.forum,
                                size: 25,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 197, 66),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => contactUs(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
