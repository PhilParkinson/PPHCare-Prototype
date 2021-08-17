import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final databaseReference = FirebaseFirestore.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clientCollection =
      FirebaseFirestore.instance.collection('clients');

  // Future<void> updateUserData(
  //     {required String uid, required String firstName, required String lastName, required String email}) async {
  //   try {
  //     await usersCollection.doc(uid).set({
  //       'uid': uid,
  //       'first_name': firstName,
  //       'last_name': lastName,
  //       'email': email
  //     });
  //     return "Created Document";
  //   } on FirebaseException catch (e) {
  //     return e.message;
  //   }
  // }

  // Future<Map> getUser(String uid) async {
  //   Map retVal;
  //   try {
  //     DocumentSnapshot doc =
  //         await databaseReference.collection('users').doc(uid).get();
  //     retVal = doc.data();
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  // Future<Map> getCurrentUserFeeling(String uid) async {
  //   Map retVal;
  //   try {
  //     QuerySnapshot collectionSnap = await databaseReference
  //         .collection('users')
  //         .doc(uid)
  //         .collection('feelings')
  //         .orderBy('order', descending: true)
  //         .limit(1)
  //         .snapshots()
  //         .first;

  //     retVal = collectionSnap.docs.single.data();
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }
}
