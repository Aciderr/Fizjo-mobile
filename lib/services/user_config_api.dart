import 'package:dio/dio.dart';
import '../env.dart';

class UserConfigApi {
  static Future<dynamic> fetchUserConfig(String token) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = token;
    final response = await dio.get<dynamic>('${apiUrl}users-configs');
    print('response ' + response.toString());
    // return response.data?.map((exerciseJson) => Exercise.fromJson(exerciseJson)).toList() ?? [];
  }
}