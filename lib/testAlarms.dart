import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'realtime2.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class testAlarms extends StatefulWidget {
  @override
  _testAlarmsState createState() => _testAlarmsState();
}

class _testAlarmsState extends State<testAlarms> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 249, 249, 10),
        body: ListPage(),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getAlarms() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("alarms").get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot alarm) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          alarm: alarm,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: Text(
              translator.translate('alarms'),
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800),
            ),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: getAlarms(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text(translator.translate('loading')),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Color.fromARGB(255, 245, 245, 249),
                          child: ListTile(
                            title: Text(
                              translator.translate('name2') +
                                  snapshot.data[index].data()["name"],
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 20,
                                  color: Colors.grey.shade800),
                            ),
                            subtitle: Text(
                              translator.translate('time') +
                                  snapshot.data[index].data()['time'] +
                                  translator.translate('\r\n') +
                                  translator.translate('date') +
                                  snapshot.data[index].data()['date'],
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 20,
                                  color: Colors.grey.shade800),
                            ),
                            leading: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.notification_important,
                                size: 25,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 197, 66),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () => navigateToDetail(
                              snapshot.data[index],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  final DocumentSnapshot alarm;
  DetailPage({this.alarm});

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Text(
                          translator.translate('alarmInfo'),
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 150),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translator.translate('name2'),
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal'),
                            ),
                            Text(
                              widget.alarm['name'],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translator.translate('type'),
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal'),
                            ),
                            Text(
                              widget.alarm['type'],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translator.translate('time'),
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal'),
                            ),
                            Text(
                              widget.alarm['time'],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translator.translate('date'),
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal'),
                            ),
                            Text(
                              widget.alarm['date'],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translator.translate('note2'),
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal'),
                            ),
                            Text(
                              widget.alarm['notes'],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                    Center(
                      child: FlatButton(
                        child: Text(
                          translator.translate('trackLoc'),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontFamily: 'Tajawal'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => realtime2()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 350,
                        height: 260,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text(
                                  translator.translate('done2'),
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
                                onPressed: () async {
                                  Navigator.pop(
                                    context,
                                    //Navigator.pop(context);
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
