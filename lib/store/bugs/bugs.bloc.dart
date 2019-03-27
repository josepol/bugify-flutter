import 'dart:async';

import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.event.dart';

class BugsBloc {

  final StreamController<List<BugModel>> _bugsStreamController = StreamController<List<BugModel>>.broadcast();
  StreamSink<List<BugModel>> get _bugsStreamSink => _bugsStreamController.sink;
  Stream<List<BugModel>> get bugs => _bugsStreamController.stream;

  final StreamController<BugModel> _bugSelectedStreamController = StreamController<BugModel>.broadcast();
  StreamSink<BugModel> get _bugSelectedStreamSink => _bugSelectedStreamController.sink;
  Stream<BugModel> get bugSelected => _bugSelectedStreamController.stream;

  final _bugsEventController = StreamController<BugsEvent>.broadcast();
  Sink<BugsEvent> get bugsEventSink => _bugsEventController.sink;
  
  BugsBloc() {
    _bugsEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(BugsEvent event) {
    if (event is GetBugsEvent) {
      this._bugsStreamSink.add(event.bugs);
    }
    if (event is SetBugSelected) {
      this._bugSelectedStreamSink.add(event.bugSelected);
    }
  }

  void dispose() {
    _bugsStreamController.close();
    _bugSelectedStreamController.close();
    _bugsEventController.close();
  }

}

BugsBloc bugsBloc = BugsBloc();