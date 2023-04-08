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
  Future signInWithEmail() async {
    try {
      // Connexion avec email et mot de passe
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: 'email@example.com', password: 'mot_de_passe');
      User? user = userCredential.user;
      // Utilisation de l'utilisateur connecté
      print('Connecté avec succès : ${user}');
    } catch (e) {}
  }
  // sign up with email & password

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
