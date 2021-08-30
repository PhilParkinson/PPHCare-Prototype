import 'package:firebase_auth/firebase_auth.dart';
import 'package:pphcare_prototype/services/database_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> getCurrentUserUid() async {
    try {
      await _firebaseAuth.currentUser!.uid.toString();
    } on FirebaseException catch (e) {
      return e.message ?? "No Current User";
    }
  }

  Future<User?> getCurrentUser() async {
    return await _firebaseAuth.currentUser ?? null;
  }

  Future<String> registerUsingEmailPassword(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String position}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      DatabaseService().updateUserData(
          uid: getCurrentUser().toString(),
          firstName: firstName,
          lastName: lastName,
          email: email,
          position: position);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      print("Error Signing up");
      return e.message ?? "Error Signing Up";
    }
  }

  Future<String> signInUsingEmailPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      print("Error Singing In");
      return e.message ?? "Error Signing In";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> refreshUser(User user) async {
    await user.reload();
    User? refreshedUser = _firebaseAuth.currentUser;
    return refreshedUser;
  }
}
