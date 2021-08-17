import 'package:firebase_auth/firebase_auth.dart';
import 'package:pphcare_prototype/services/database_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  String? userUid;

  // Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  // String currentUserUid() {
  //   return userUid;
  // }

  // Future<String?> logIn(
  //     {required String email, required String password}) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     userUid = _firebaseAuth.currentUser!.uid;
  //     return "Logged In";
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  // Future<String?> signUp(
  //     {required String email, required String password}) async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     userUid = _firebaseAuth.currentUser!.uid;
  //     return "Signed Up";
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  //   userUid = Null;
  // }
}
