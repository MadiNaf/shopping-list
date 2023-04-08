import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_list/models/user.model.dart';

class AuthService {
  late final FirebaseApp app;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserEntity getEmptyUser() => UserEntity(uid: '', email: '');

  UserEntity _userFromFirebaseUser(User? user) {
    String email = user?.email ?? '';
    return user != null
        ? UserEntity(uid: user.uid, email: email)
        : getEmptyUser();
  }

  // sign in anonymous
  Future<UserEntity> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return _userFromFirebaseUser(null);
    }
  }

  // sign in with email & password
  Future<UserEntity> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Connexion avec email et mot de passe
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return _userFromFirebaseUser(null);
    }
  }

  // sign up with email & password
  Future<UserEntity> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return _userFromFirebaseUser(null);
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  // auth change user stream
  Stream<UserEntity> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }
}
