import 'package:flutter/material.dart';
import 'package:profile_app/screens/profile_screen.dart';
import 'package:profile_app/widgets/textfields.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  static const route = "/login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEnable = false;

  final _keyFormLogin = GlobalKey<FormState>();
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _passwordControler.addListener(() {
      var isEnable =
          _passwordControler.text.isNotEmpty && _emailControler.text.isNotEmpty;
      setState(() => this.isEnable = isEnable);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _passwordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyFormLogin,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                usernameField(_emailControler),
                passwordField(_passwordControler),
                _loginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 10, 32, 12),
      width: MediaQuery.of(context).size.width,
      height: 46.0,
      child: ElevatedButton(
          onPressed: isEnable
              ? () {
                  if (_keyFormLogin.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, ProfileScreen.route,
                        arguments: _emailControler.text);
                  }
                }
              : null,
          child: Text("Sign In")),
    );
  }
}
