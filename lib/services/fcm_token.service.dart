import 'package:firebase_messaging/firebase_messaging.dart';

class TokenMonitor {
  String? _token;
  late Stream<String> _tokenStream;

  void setToken(String? token) {
    _token = token;
    print("_token: " + _token.toString());
  }

  void initialize() {
    FirebaseMessaging.instance
        .getToken()
        .then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);
  }
}