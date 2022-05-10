import 'package:dio/dio.dart';
import 'package:fizjo/services/http_service.dart';
import 'package:get/get.dart';
import '../env.dart';

class UserConfigApi {
  static Future<dynamic> fetchUserConfig(String token) async {
    var httpService = Get.find<HttpService>().instance;
    final response = await httpService.get<dynamic>('${apiUrl}users-configs');
    // return response.data?.map((exerciseJson) => Exercise.fromJson(exerciseJson)).toList() ?? [];
  }
}