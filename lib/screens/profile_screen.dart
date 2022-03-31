import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_app/common/constants.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const route = "/profile-screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            image != null
                ? ClipOval(
                    child: Image.file(image!,
                        width: 160, height: 160, fit: BoxFit.cover))
                : FlutterLogo(
                    size: 160,
                  ),
            space(),
            _raisedButton("Pick a photo", _showPicker),
            space(),
            _raisedButton(
                "Logout",
                () =>
                    Navigator.pushReplacementNamed(context, LoginScreen.route))
          ],
        )),
      ),
    );
  }

  Widget _raisedButton(String label, Function() function) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 10, 32, 12),
      width: MediaQuery.of(context).size.width,
      height: 46.0,
      child: ElevatedButton(onPressed: function, child: Text(label)),
    );
  }

  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgSource(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgSource(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _imgSource(ImageSource source) async {
    try {
      final image = (await ImagePicker().pickImage(source: source));

      if (image == null) return;

      setState(() {
        this.image = File(image.path);
        print("success picked file ${this.image} ✅ ✅ ✅");
      });
    } on PlatformException catch (e) {
      print("failed to pick image cause $e");
    }
  }
}
