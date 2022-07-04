import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_project/loading.dart';
import 'waiting.dart';
import 'package:training_project/RecordingScreen.dart';
import 'uploadimage.dart';
import 'RecordingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'location.dart';
import 'package:location/location.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

bool selected01 = true;
bool selected02 = true;
bool selected03 = true;
bool selected04 = true;
bool selected05 = true;

class selectHelp extends StatefulWidget {
  @override
  _selectHelpState createState() => _selectHelpState();
}

class _selectHelpState extends State<selectHelp> {
  @override
  bool loading = false;

  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController helptypecontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController voicecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  @override
  void dispose() {
    helptypecontroller.dispose();
    notescontroller.dispose();
    imagecontroller.dispose();
    voicecontroller.dispose();
    locationcontroller.dispose();
    timecontroller.dispose();
    namecontroller.dispose();

    super.dispose();
  }

  LocationData _location;

  Widget build(BuildContext context) {
    String currentTime = DateFormat.jm().format(DateTime.now());
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Stack(
                  children: [
                    Container(
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
                                vertical: 10.0, horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: IconButton(
                                    icon: new Icon(Icons.arrow_back,
                                        color: const Color(0xED000000),
                                        size: 30),
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    child: Text(
                                      translator.translate('selectHelp'),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Tajawal",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Container(
                                    width: 323,
                                    height: 260,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        //--------------------------Buttons-----------------------------------------------------
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //--------Fire Alarm Botton----------
                                              Container(
                                                width: 96.11,
                                                height: 119.05,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 96.11,
                                                      height: 119.05,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                              translator
                                                                  .translate(
                                                                      'fire'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Tajawal",
                                                                color: Color(
                                                                    0xff130f26),
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width: 93.30,
                                                            height: 93.78,
                                                            child:
                                                                ElevatedButton(
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: selected01
                                                                        ? DecorationImage(
                                                                            image:
                                                                                AssetImage('lib/img/Fire.png'),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      selected01
                                                                          ? null
                                                                          : Icons
                                                                              .check_circle,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: selected01
                                                                    ? Color(
                                                                        0xffff575f)
                                                                    : Color(
                                                                        0xffffb8bc),
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                elevation:
                                                                    selected01
                                                                        ? 10
                                                                        : 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              46.0),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    selected01 =
                                                                        false;
                                                                    selected02 =
                                                                        true;
                                                                    selected03 =
                                                                        true;
                                                                    selected04 =
                                                                        true;
                                                                    selected05 =
                                                                        true;
                                                                    if (selected01 ==
                                                                        false) {
                                                                      helptypecontroller
                                                                              .text =
                                                                          translator
                                                                              .translate('fire');
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              //--------Stuck in an Elevator Button-------
                                              Container(
                                                width: 96.11,
                                                height: 116.05,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 96.11,
                                                      height: 116.05,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                              translator
                                                                  .translate(
                                                                      'elevator'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Tajawal",
                                                                color: Color(
                                                                    0xff130f26),
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width: 93.30,
                                                            height: 93.78,
                                                            child:
                                                                ElevatedButton(
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: selected02
                                                                        ? DecorationImage(
                                                                            image:
                                                                                AssetImage('lib/img/Person.png'),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      selected02
                                                                          ? null
                                                                          : Icons
                                                                              .check_circle,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: selected02
                                                                    ? Color(
                                                                        0xffffc54b)
                                                                    : Color(
                                                                        0xffffeab9),
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                elevation:
                                                                    selected02
                                                                        ? 10
                                                                        : 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              46.0),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    selected02 =
                                                                        false;
                                                                    selected01 =
                                                                        true;
                                                                    selected03 =
                                                                        true;
                                                                    selected04 =
                                                                        true;
                                                                    selected05 =
                                                                        true;
                                                                    if (selected02 ==
                                                                        false) {
                                                                      helptypecontroller
                                                                              .text =
                                                                          translator
                                                                              .translate('elevator');
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              //--------Medical Help Button---------
                                              Container(
                                                width: 96.11,
                                                height: 116.05,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 96.11,
                                                      height: 116.05,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                              translator
                                                                  .translate(
                                                                      'hospital'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Tajawal",
                                                                color: Color(
                                                                    0xff130f26),
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width: 93.30,
                                                            height: 93.78,
                                                            child:
                                                                ElevatedButton(
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: selected03
                                                                        ? DecorationImage(
                                                                            image:
                                                                                AssetImage('lib/img/Vector.png'),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      selected03
                                                                          ? null
                                                                          : Icons
                                                                              .check_circle,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: selected03
                                                                    ? Color(
                                                                        0xff3b87ff)
                                                                    : Color(
                                                                        0xffb4d1ff),
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                elevation:
                                                                    selected03
                                                                        ? 10
                                                                        : 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              46.0),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    selected03 =
                                                                        false;
                                                                    selected01 =
                                                                        true;
                                                                    selected02 =
                                                                        true;
                                                                    selected04 =
                                                                        true;
                                                                    selected05 =
                                                                        true;
                                                                    if (selected03 ==
                                                                        false) {
                                                                      helptypecontroller
                                                                              .text =
                                                                          translator
                                                                              .translate('hospital');
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),

                                        //---------------------------Else and Closed Place buttons------------------------------
                                        Container(
                                          width: 210.11,
                                          height: 116.05,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 109,
                                                height: 116.05,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 109,
                                                      height: 116.05,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 109,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  child: Text(
                                                                    translator
                                                                        .translate(
                                                                            'class'),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          "Tajawal",
                                                                      color: Color(
                                                                          0xff130f26),
                                                                      fontSize:
                                                                          11.70,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width: 93.30,
                                                            height: 93.78,
                                                            child:
                                                                ElevatedButton(
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: selected04
                                                                        ? DecorationImage(
                                                                            image:
                                                                                AssetImage('lib/img/Lock.png'),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      selected04
                                                                          ? null
                                                                          : Icons
                                                                              .check_circle,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: selected04
                                                                    ? Color(
                                                                        0xff755fe2)
                                                                    : Color(
                                                                        0xffcac0ff),
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                elevation:
                                                                    selected04
                                                                        ? 10
                                                                        : 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              46.0),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    selected04 =
                                                                        false;
                                                                    selected01 =
                                                                        true;
                                                                    selected02 =
                                                                        true;
                                                                    selected03 =
                                                                        true;
                                                                    selected05 =
                                                                        true;
                                                                    if (selected04 ==
                                                                        false) {
                                                                      helptypecontroller
                                                                              .text =
                                                                          translator
                                                                              .translate('class');
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 96.11,
                                                    height: 116.05,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          child: Text(
                                                            translator
                                                                .translate(
                                                                    'other'),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Tajawal",
                                                              color: Color(
                                                                  0xff130f26),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 3.96),
                                                        Container(
                                                          width: 93.30,
                                                          height: 93.78,
                                                          child: ElevatedButton(
                                                            child: Center(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image: selected05
                                                                      ? DecorationImage(
                                                                          image:
                                                                              AssetImage('lib/img/Other.png'),
                                                                        )
                                                                      : null,
                                                                ),
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    selected05
                                                                        ? null
                                                                        : Icons
                                                                            .check_circle,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary: selected05
                                                                  ? Color(
                                                                      0xffff974a)
                                                                  : Color(
                                                                      0xffffd6b7),
                                                              onPrimary:
                                                                  Colors.white,
                                                              elevation:
                                                                  selected05
                                                                      ? 10
                                                                      : 0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            46.0),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              setState(
                                                                () {
                                                                  selected05 =
                                                                      false;
                                                                  selected01 =
                                                                      true;
                                                                  selected02 =
                                                                      true;
                                                                  selected03 =
                                                                      true;
                                                                  selected04 =
                                                                      true;
                                                                  if (selected05 ==
                                                                      false) {
                                                                    helptypecontroller
                                                                            .text =
                                                                        translator
                                                                            .translate('other');
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 5),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    currentDate + " " + currentTime,
                                    style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 343,
                                              height: 76,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(
                                                  color: Color(0xff286053),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 340,
                                            height: 200,
                                            padding: EdgeInsets.all(10),
                                            child: TextFormField(
                                              controller: namecontroller,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Color(0xfff2f3f7),
                                                hintText: (translator
                                                    .translate('name')),
                                                hintStyle: TextStyle(
                                                    fontFamily: 'Tajawal'),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.35),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 343,
                                                  height: 76,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    border: Border.all(
                                                      color: Color(0xff286053),
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: 340,
                                                  height: 200,
                                                  padding: EdgeInsets.all(10),
                                                  child: TextFormField(
                                                    controller: notescontroller,
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xfff2f3f7),
                                                      hintText: (translator
                                                          .translate('note')),
                                                      hintStyle: TextStyle(
                                                          fontFamily:
                                                              'Tajawal'),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.35),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    //addtional options
                                    Column(
                                      children: [
                                        Container(
                                          //color: Colors.blue,
                                          width: 324,
                                          height: 88,
                                          child: Center(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                //------------take a picture
                                                Column(
                                                  children: [
                                                    InkWell(
                                                      child: Container(
                                                        width: 56,
                                                        height: 56,
                                                        child: Material(
                                                          color: // Color(0xff286053),
                                                              Color(0xff000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(28),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            child: Center(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: // Color(0xff3ed598),
                                                                      Color(
                                                                          0xffa3a3a3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              23),
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .linked_camera,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // onTap: () {
                                                      //   Navigator.pushReplacement(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //       builder: (context) =>
                                                      //           uploadimage(),
                                                      //     ),
                                                      //   );
                                                      // },
                                                    ),
                                                    SizedBox(height: 7),
                                                    SizedBox(
                                                      child: Text(
                                                        translator
                                                            .translate('pic'),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Tajawal',
                                                          color: // Color(0xff3ed598),
                                                              Color(0xff000000),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  children: [
                                                    InkWell(
                                                      child: Container(
                                                        width: 56,
                                                        height: 56,
                                                        child: Material(
                                                          color: // Color(0xff286053),
                                                              Color(0xff000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(28),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            child: Center(
                                                              child: Container(
                                                                width: 47,
                                                                height: 47,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: // Color(0xff3ed598),
                                                                      Color(
                                                                          0xffa3a3a3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              23),
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .mic_rounded,
                                                                    size: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // onTap: () {
                                                      //   Navigator.pushReplacement(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //       builder: (context) =>
                                                      //           RecordingScreen(),
                                                      //     ),
                                                      //   );
                                                      // },
                                                    ),
                                                    SizedBox(height: 6.90),
                                                    SizedBox(
                                                      child: Text(
                                                        translator
                                                            .translate('voice'),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Tajawal',
                                                          color: // Color(0xff3ed598),
                                                              Color(0xff000000),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: SizedBox(
                                        height: 200.0,
                                        child: location(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    translator.translate('detectLoc'),
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: 'Tajawal'),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    child: Text(
                                      translator.translate('sendReq'),
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: 'Tajawal'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 61, 213, 152),
                                      onPrimary: Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(
                                        () {
                                          loading = true;
                                        },
                                      );
                                      Location location = new Location();
                                      _location = await location.getLocation();
                                      var userInfo = FirebaseFirestore.instance
                                          .collection('alarms')
                                          .doc()
                                          .set(
                                        {
                                          'name': namecontroller.text,
                                          'type': helptypecontroller.text,
                                          'notes': notescontroller.text,
                                          'time': currentTime.toString(),
                                          'date': currentDate.toString(),
                                          'location': GeoPoint(
                                              _location.latitude,
                                              _location.longitude),
                                        },
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => waiting(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
