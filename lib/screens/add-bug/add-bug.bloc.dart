import 'dart:async';

class AddBugBloc {
  StreamController<String> submitStreamController;

  AddBugBloc();

  void start() {
    this.submitStreamController = StreamController<String>.broadcast();
  }

  void close() {
    this.submitStreamController.close();
  }

}

AddBugBloc addBugBloc = AddBugBloc();