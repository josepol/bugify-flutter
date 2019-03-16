import 'package:bugify/bug.model.dart';

abstract class HomeEvent {}

class GetBugsEvent extends HomeEvent {

  List<BugModel> bugs = List();

  GetBugsEvent(List<BugModel> bugs) {
    this.bugs = bugs;
  }
}