import 'package:rxdart/rxdart.dart';

class AddBugBloc {
  BehaviorSubject _submitFormSubject = BehaviorSubject<bool>();

  static final _addBugBloc = AddBugBloc._internal();

  factory AddBugBloc() {
    return _addBugBloc;
  }

  AddBugBloc._internal() {
  }

  void setSubmitFormSubject() {
    this._submitFormSubject.add(true);
  }

  BehaviorSubject getSubmitFormSubject() {
    return this._submitFormSubject;
  }

  void close() {
    this._submitFormSubject.close();
  }

}