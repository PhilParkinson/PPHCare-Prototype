import 'package:pphcare_prototype/models/care_plan_tasks.dart';

class RecordOfCare {
  List<CarePlanTask> tasksCompleted;
  String uid;
  int callLenght;
  String callUid;

  RecordOfCare(
      {required this.tasksCompleted,
      required this.uid,
      required this.callLenght,
      required this.callUid});

  addCompletedTask(CarePlanTask task) {
    print('Added Task');
    tasksCompleted.add(task);
    print(tasksCompleted.length);
  }

  removeTaskFromCompletedList(CarePlanTask task) {
    print('Removed Task');
    tasksCompleted.removeWhere((element) => element.uid == task.uid);
    print(tasksCompleted);
  }
}

class CallRecord {
  String uid;
  DateTime arrivalTime;
  DateTime? departureTime;
  int? callLength;
  String carerUid;
  String clientUid;
  String drsUid;

  CallRecord(
      {required this.uid,
      required this.arrivalTime,
      required this.carerUid,
      required this.clientUid,
      required this.drsUid});

  updateCallRecord(DateTime departureTime) {
    print('Call Record Updated');
    departureTime = departureTime;
    callLength = departureTime.minute - arrivalTime.minute;
    callLength = callLength!;
  }
}
