import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pphcare_prototype/models/client.dart';
import 'package:pphcare_prototype/models/user.dart';
import 'package:pphcare_prototype/services/authentication_service.dart';

class DatabaseService {
  final databaseReference = FirebaseFirestore.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clientCollection =
      FirebaseFirestore.instance.collection('clients');

  Future<String> updateUserData(
      {required String uid,
      required String firstName,
      required String lastName,
      required String email,
      String? position}) async {
    try {
      await userCollection.doc(uid).set({
        'uid': uid,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'position': position ?? "Junior"
      });
      return "Created Document";
    } on FirebaseException catch (e) {
      return e.message ?? "Error Creating User Document";
    }
  }

  Future<PPHCareUser> getPPHCareUser(String uid) async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();
    Map<String, dynamic> retVal = snapshot.data() as Map<String, dynamic>;
    return PPHCareUser.fromMap(retVal);
  }

  Future<PPHCareUser> getCurrentUser() async {
    User? authUser = await AuthenticationService().getCurrentUser();
    if (authUser != null) {
      Future<PPHCareUser> currentUser = getPPHCareUser(authUser.uid);
      return currentUser;
    } else {
      return PPHCareUser(
          firstName: "", lastName: "", email: "", position: "", uid: "");
    }
  }

  Stream<DocumentSnapshot> getClientFromQRCode(String uid) {
    return clientCollection.doc(uid).get().asStream();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCarePlanInfoForClient(
      String uid) {
    return clientCollection.doc(uid).collection('carePlans').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCarePlanTasks(
      String clientUid, String carePlanUid) {
    return clientCollection
        .doc(clientUid)
        .collection('carePlans')
        .doc(carePlanUid)
        .collection('Tasks')
        .snapshots();
  }
}
