import 'package:dio/dio.dart';

class HttpService {
  Dio instance = Dio();

  HttpService(List<Interceptor> interceptors) {
    instance.interceptors.addAll(interceptors);
  }
}