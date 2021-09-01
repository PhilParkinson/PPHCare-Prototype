import 'package:flutter/material.dart';
import 'package:pphcare_prototype/models/care_plan_tasks.dart';

class CarePlan {
  bool active;
  String call;
  int carers;
  DateTime createdOn;
  int length;
  String uid;
  List<CarePlanTask>? tasks;

  CarePlan(
      {required this.active,
      required this.call,
      required this.carers,
      required this.createdOn,
      required this.length,
      required this.uid});

  static fromJSON(AsyncSnapshot snapshot) {
    return CarePlan(
        active: snapshot.data.docs[0]['active'],
        uid: snapshot.data.docs[0]['uid'] as String,
        call: snapshot.data.docs[0]['call'] as String,
        carers: snapshot.data.docs[0]['carers'] as int,
        createdOn: snapshot.data.docs[0]['createdOn'].toDate(),
        length: snapshot.data.docs[0]['timeMins'] as int);
  }
}
