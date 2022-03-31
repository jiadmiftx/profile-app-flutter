import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  Future<bool> signUp() async {
    await Future.delayed(Duration(milliseconds: 3));
    return true;
  }
}
