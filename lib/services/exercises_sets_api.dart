import 'package:fizjo/models/exercise-set-detailed.dart';
import 'package:fizjo/models/exercise-set.dart';
import 'package:fizjo/services/http_service.dart';
import 'package:get/get.dart';
import '../env.dart';

class ExercisesSetsApi {
  Future<List<ExerciseSet>> fetchExercisesSets() async {
    var httpService = Get.find<HttpService>().instance;
    final response = await httpService.get<List<dynamic>>('${apiUrl}exercises-sets');
    return response.data?.map((exerciseSetJson) => ExerciseSet.fromJson(exerciseSetJson)).toList() ?? [];
  }

  Future<ExerciseSetDetailed> fetchExerciseSet(String id) async {
    var httpService = Get.find<HttpService>().instance;
    final response = await httpService.get<dynamic>('${apiUrl}exercises-sets/$id');
    return ExerciseSetDetailed.fromJson(response.data);
  }
}