import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjo/services/user_config_api.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUserProvider extends ChangeNotifier {
  User? _user;

  User? selectUser() {
    return _user;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    setLoggedInUserDataIfLoggedIn();
  }

  void setLoggedInUserDataIfLoggedIn() async {
    _user = FirebaseAuth.instance.currentUser;

    // TODO Remove this test.
    if (_user != null) {
      var token = await _user!.getIdToken();
      UserConfigApi.fetchUserConfig(token);
    }
    notifyListeners();
  }
}