import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/services/http_service.dart';
import 'package:get/get.dart';
import '../env.dart';

class ExercisesApi {
  Future<List<Exercise>> fetchExercises() async {
    var httpService = Get.find<HttpService>().instance;
    final response = await httpService.get<List<dynamic>>('${apiUrl}exercises');
    return response.data?.map((exerciseJson) => Exercise.fromJson(exerciseJson)).toList() ?? [];
  }
}