import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarePlanTask {
  String uid;
  int order;
  String description;
  bool medication;
  List<MAR>? marTasks;

  CarePlanTask(
      {required this.uid,
      required this.order,
      required this.description,
      required this.medication});

  static fromJSON(QueryDocumentSnapshot<Object?> snapshot) {
    return CarePlanTask(
        uid: snapshot['uid'] as String,
        description: snapshot['description'] as String,
        order: snapshot['order'] as int,
        medication: snapshot['createdOn'] as bool);
  }
}

class MAR {
  String uid;
  String medicationName;
  String dosage;

  MAR({required this.uid, required this.medicationName, required this.dosage});
}
