import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjo/models/user-config.dart';
import 'package:fizjo/services/user_config_api.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUserProvider extends ChangeNotifier {
  UserConfig? user;
  User? firebaseUser;

  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      if (error.code.contains("wrong-password")) {
        throw "Niepoprawne hasło.";
      }
      if (error.code.contains("user-not-found")) {
        throw "Nie istnieje użytkownik z podanym adresem Email.";
      }
      if (error.code.contains("user-disabled")) {
        throw "Użytkownik jest zablokowany.";
      }

      throw "Błąd serwera, spróbuj później.";
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      if (error.code.contains("email-already-in-use")) {
        throw "Istnieje już konto z podanym adresem Email.";
      }

      throw "Błąd serwera, spróbuj później.";
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void logOut() async {
    FirebaseAuth.instance.signOut();
    user = null;
    notifyListeners();
  }

  Future<void> fetchUser() async {
    user = await UserApi.fetchUserMe();
    notifyListeners();
  }

  Future<void> createUser() async {
    await UserApi.createUserMe();
  }
}