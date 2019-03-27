import 'package:bugify/screens/add-bug/add-bug-form.widget.dart';
import 'package:bugify/screens/add-bug/add-bug.bloc.dart';
import 'package:bugify/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class AddBugScreen extends StatefulWidget {
  AddBugScreen({Key key}) : super(key: key);

  _AddBugScreenState createState() => _AddBugScreenState();
}

class _AddBugScreenState extends State<AddBugScreen> {

  void submitForm() => addBugBloc.submitStreamController.sink.add('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add bug'),
      ),
      body: Container(child: AddBugFormWidget()),
      bottomNavigationBar: ButtonWidget(
        onPressCallback: this.submitForm,
        isButtonEnabled: true,
        buttonText: 'ADD',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
