import 'dart:async';

import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.event.dart';

class BugsBloc {

  final StreamController<List<BugModel>> _bugsStreamController = StreamController<List<BugModel>>();
  StreamSink<List<BugModel>> get _bugsStreamSink => _bugsStreamController.sink;
  Stream<List<BugModel>> get bugs => _bugsStreamController.stream;

  final _bugsEventController = StreamController<BugsEvent>();
  Sink<BugsEvent> get homeEventSink => _bugsEventController.sink;
  
  BugsBloc() {
    _bugsEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(BugsEvent event) {
    if (event is GetBugsEvent) {
      this._bugsStreamSink.add(event.bugs);
    }
  }

  void dispose() {
    _bugsStreamController.close();
    _bugsEventController.close();
  }

}