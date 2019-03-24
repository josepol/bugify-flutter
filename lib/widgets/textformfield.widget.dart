import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final bool isRequired;
  final int maxLength;
  final bool autovalidate;
  final Function onSavedCallback;
  final TextInputType type;

  TextFormFieldWidget(
      {@required this.label,
      this.isRequired = false,
      this.maxLength,
      @required this.onSavedCallback,
      this.autovalidate = false,
      this.type = TextInputType.text});

  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  String _validator(String value) {
    if (this.widget.isRequired && value.isEmpty) {
      return 'This field is required';
    }
    if (this.widget.maxLength != null &&
        value.length >= this.widget.maxLength) {
      return 'Max length allowed is ${this.widget.maxLength}';
    }
    return null;
  }

  void _onSaved(String value) {
    this.widget.onSavedCallback(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
            keyboardType: this.widget.type,
            maxLines: this.widget.type == TextInputType.multiline ? 4 : 1,
            decoration: InputDecoration(
              labelText: this.widget.label,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeConfig.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onSaved: this._onSaved,
            validator: this._validator,
            autovalidate: this.widget.autovalidate));
  }
}
