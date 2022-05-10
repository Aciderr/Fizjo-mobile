import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = FirebaseAuth.instance.currentUser;
    final token = await user?.getIdToken();
    options.headers['Authorization'] = 'Bearer $token';
    return super.onRequest(options, handler);
  }
}