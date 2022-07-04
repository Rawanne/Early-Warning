import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'selectHelp.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class uploadimage extends StatefulWidget {
  @override
  _uploadimageState createState() => _uploadimageState();
}

class _uploadimageState extends State<uploadimage> {
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      translator.translate('pic'),
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                (imageUrl != null)
                    ? Image.network(imageUrl)
                    : Placeholder(
                        fallbackHeight: 200.0, fallbackWidth: double.infinity),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text(translator.translate('attach')),
                  color: Color.fromARGB(255, 61, 213, 152),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () => uploadImage(),
                ),
                RaisedButton(
                  child: Text(translator.translate('continue')),
                  color: Color.fromARGB(255, 61, 213, 152),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => selectHelp()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.camera);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot =
            await _storage.ref().child('folderName/imageName').putFile(file);
        //.onComplete;

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
