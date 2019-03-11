import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressCallback;
  final bool isButtonEnabled;
  final String buttonText;
  final String leftImage;

  ButtonWidget(
      {Key key,
      this.onPressCallback,
      this.isButtonEnabled,
      this.buttonText,
      this.leftImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
                  padding: EdgeInsets.all(10),
                  onPressed: this.isButtonEnabled != null && this.isButtonEnabled ? this.onPressCallback : () {},
                  color: this.isButtonEnabled != null && this.isButtonEnabled ? ThemeConfig.primaryColor : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        this.leftImage != null
                            ? Image(
                                image: AssetImage(this.leftImage),
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              )
                            : Container(),
                        Text(this.buttonText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        Container()
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
