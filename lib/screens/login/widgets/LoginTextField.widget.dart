import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';

class LoginTextFieldButton extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  final Function textOnChangeCallback;
  final bool autofocus;

  final TextEditingController controller;

  LoginTextFieldButton({Key key, this.isPassword, this.hintText, this.textOnChangeCallback, this.autofocus, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: this.controller,
          autofocus: this.autofocus != null ? this.autofocus : false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeConfig.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeConfig.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeConfig.primaryColor, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: this.hintText,
            prefixIcon: Icon(
              isPassword ? Icons.lock : Icons.person,
              color: ThemeConfig.primaryColor,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          obscureText: this.isPassword,
          onChanged: this.textOnChangeCallback,
          textAlign: TextAlign.center,
          autocorrect: false,
          style: TextStyle(
          ),
        ));
  }
}
