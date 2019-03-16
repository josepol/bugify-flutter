import 'dart:async';

import 'package:bugify/bug.model.dart';
import 'package:bugify/screens/home/home.event.dart';

class HomeBloc {
  List<BugModel> _bugs = [];

  final StreamController<List<BugModel>> _bugsStateController = StreamController<List<BugModel>>();
  StreamSink<List<BugModel>> get _inBugs => _bugsStateController.sink;
  Stream<List<BugModel>> get bugs => _bugsStateController.stream;

  final _bugsEventController = StreamController<HomeEvent>();
  Sink<HomeEvent> get homeEventSink => _bugsEventController.sink;
  
  HomeBloc() {
    _bugsEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(HomeEvent event) {
    if (event is GetBugsEvent) {
      this._inBugs.add(event.bugs);
    }
  }

  void dispose() {
    _bugsStateController.close();
    _bugsEventController.close();
  }

}