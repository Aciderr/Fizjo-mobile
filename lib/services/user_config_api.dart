import 'package:fizjo/models/user-config.dart';
import 'package:fizjo/services/http_service.dart';
import 'package:get/get.dart';
import '../env.dart';

class UserApi {
  static Future<dynamic> fetchUserMe() async {
    var httpService = Get.find<HttpService>().instance;
    final response = await httpService.get<dynamic>('${apiUrl}users/me');
    return UserConfig.fromJson(response.data);
  }

  static Future<void> createUserMe() async {
    var httpService = Get.find<HttpService>().instance;
    await httpService.post<dynamic>('${apiUrl}users/me');
  }
}