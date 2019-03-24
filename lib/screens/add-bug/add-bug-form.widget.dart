import 'package:bugify/screens/add-bug/add-bug.bloc.dart';
import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/widgets/textformfield.widget.dart';
import 'package:flutter/material.dart';

class AddBugFormWidget extends StatefulWidget {
  AddBugFormWidget();

  _AddBugFormWidgetState createState() => _AddBugFormWidgetState();
}

class _AddBugFormWidgetState extends State<AddBugFormWidget> {
  AddBugBloc addBugBloc = AddBugBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFormValid = false;
  BugModel bug;
  bool _autovalidate = false;

  @override
  void initState() {
    this.addBugBloc.getSubmitFormSubject().listen((x) {
      this.submitForm();
    });
    super.initState();
  }

  void submitForm() {
    this.isFormValid = this._formKey.currentState.validate();
    if (!this.isFormValid) {
      this._autovalidate = true;
    } else {
      this._formKey.currentState.save();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: new Text("Adding new bug!"),
      ));
    }
  }

  void _saveData(String key, value) {
    Map<String, dynamic> v = {key: value};
    this.bug = BugModel.fromJson(v);
    print(this.bug.toJson());
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
    this._autovalidate = false;
    this.addBugBloc.close();
    super.dispose();
  }
}
