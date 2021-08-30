import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pphcare_prototype/models/user.dart';

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
    DocumentSnapshot snapshot =
        await databaseReference.collection('users').doc(uid).get();
    Map<String, dynamic> retVal = snapshot.data() as Map<String, dynamic>;
    return PPHCareUser.fromMap(retVal);
  }
}
