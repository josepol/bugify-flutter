import 'package:bugify/screens/add-bug/add-bug.bloc.dart';
import 'package:bugify/screens/add-bug/add-bug.provider.dart';
import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/widgets/snackbar.widget.dart';
import 'package:bugify/widgets/textformfield.widget.dart';
import 'package:flutter/material.dart';

class AddBugFormWidget extends StatefulWidget {
  AddBugFormWidget();

  _AddBugFormWidgetState createState() => _AddBugFormWidgetState();
}

class _AddBugFormWidgetState extends State<AddBugFormWidget> {
  AddBugProvider addBugProvider = AddBugProvider();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> _formValue = Map();
  bool isFormValid = false;
  BugModel bug;
  bool _autovalidate = false;

  @override
  void initState() {
    addBugBloc.start();
    this._listenSubmitEvent();
    super.initState();
  }

  void _listenSubmitEvent() {
    addBugBloc.submitStreamController.stream.listen((x) {
      this._submitForm();
    });
  }

  void _submitForm() {
    this.isFormValid = this._formKey.currentState.validate();
    if (!this.isFormValid) {
      this.setState(() => this._autovalidate = true);
    } else {
      this._formKey.currentState.save();
      this.bug = BugModel.fromJson(this._formValue);
      this.addBugProvider.add(this.bug).then((response) {
        this._formKey.currentState.reset();
        this.setState(() => this._autovalidate = false);
        SnackBarWidget.openSnack(context: context, text: 'New bug added!', type: 'success');
      }, onError: (err) {
        SnackBarWidget.openSnack(context: context, text: 'There was a problem!', type: 'error');
      });
    }
  }

  void _saveData(String key, value) {
    this._formValue[key] = value;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        child: Form(
            key: this._formKey,
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  label: 'Title',
                  isRequired: true,
                  maxLength: 20,
                  autovalidate: this._autovalidate,
                  onSavedCallback: (String value) =>
                      this._saveData('title', value),
                ),
                TextFormFieldWidget(
                  label: 'Description',
                  isRequired: true,
                  type: TextInputType.multiline,
                  autovalidate: this._autovalidate,
                  onSavedCallback: (String value) =>
                      this._saveData('description', value),
                ),
                TextFormFieldWidget(
                  label: 'Solution',
                  isRequired: true,
                  type: TextInputType.multiline,
                  autovalidate: this._autovalidate,
                  onSavedCallback: (String value) =>
                      this._saveData('solution', value),
                ),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    addBugBloc.close();
    super.dispose();
  }
}
