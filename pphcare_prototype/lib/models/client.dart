import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PPHCareClient {
  String firstName;
  String lastName;
  String mobile;
  String email;
  bool? active;
  String uid;
  String addressOne;
  String addressTwo;
  String addressCity;
  String addressPostCode;

  PPHCareClient(
      {required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.email,
      required this.uid,
      required this.addressOne,
      required this.addressTwo,
      required this.addressCity,
      required this.addressPostCode});

  static fromMap(Map<String, dynamic> map) {
    return PPHCareClient(
      firstName: map['firstName'],
      lastName: map['lastName'],
      mobile: map['moobile'],
      email: map['email'],
      uid: map['uid'],
      addressOne: map['addressOne'],
      addressTwo: map['addressTwo'],
      addressCity: map['addressCity'],
      addressPostCode: map['addressPostCode'],
    );
  }

  static fromJSON(AsyncSnapshot snapshot) {
    return PPHCareClient(
        firstName: snapshot.data['firstName'] as String,
        lastName: snapshot.data['lastName'] as String,
        mobile: snapshot.data['mobile'] as String,
        email: snapshot.data['email'] as String,
        uid: snapshot.data['uid'] as String,
        addressOne: snapshot.data['addressLineOne'] as String,
        addressTwo: snapshot.data['addressLineTwo'] as String,
        addressCity: snapshot.data['addressCity'] as String,
        addressPostCode: snapshot.data['addressPostCode'] as String);
  }
}
