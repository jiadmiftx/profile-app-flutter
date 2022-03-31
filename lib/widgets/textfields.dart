import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/common/extensions.dart';

Widget usernameField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(32, 10, 32, 12),
    child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Username',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFC8C8C8),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF18B3A8),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffd01414),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffd01414),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 4),
            suffixIcon: Icon(Icons.person_outline)),
        validator: (value) {
          if (value!.isEmpty) {
            return "email must not be empty";
          } else if (!value.isValidEmail()) {
            return "email not valid";
          } else {
            return null;
          }
        },
        onChanged: (value) {}),
  );
}

Widget passwordField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(32, 10, 32, 12),
    child: TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFC8C8C8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF18B3A8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffd01414),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffd01414),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          errorMaxLines: 3,
          contentPadding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 4),
          suffixIcon: Icon(Icons.vpn_key_outlined)),
      validator: (value) {
        if (value!.isEmpty) {
          return "password must not be empty";
        } else if (value.length < 8) {
          return "password at least 8 characters—the more characters, the better";
        } else if (!value.isValidPassword()) {
          return "password must use at least three of the four available character types: lowercase letters, uppercase letters, numbers, and symbols";
        }
      },
      onChanged: (value) {},
    ),
  );
}
