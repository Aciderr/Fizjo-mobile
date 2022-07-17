import 'package:fizjo/interceptors/token.interceptor.dart';
import 'package:fizjo/services/exercises_api.dart';
import 'package:fizjo/services/exercises_sets_api.dart';
import 'package:fizjo/services/hive_api.dart';
import 'package:fizjo/services/http_service.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ServiceLocatorService {
  void initialize() {
    Get.put(ExercisesApi());
    Get.put(ExercisesSetsApi());
    Get.put(FizjoHive());
    Get.put(HttpService([TokenInterceptor(), PrettyDioLogger(requestHeader: true)]));
  }
}