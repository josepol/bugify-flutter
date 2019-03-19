import 'package:bugify/store/bugs/bug.model.dart';

abstract class BugsEvent {}

class GetBugsEvent extends BugsEvent {

  List<BugModel> bugs = List();

  GetBugsEvent(List<BugModel> bugs) {
    this.bugs = bugs;
  }

}

class SetBugSelected extends BugsEvent {

  BugModel bugSelected = BugModel();

  SetBugSelected(BugModel bug) {
    this.bugSelected = bug;
  }
}