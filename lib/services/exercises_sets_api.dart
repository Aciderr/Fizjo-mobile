import 'package:dio/dio.dart';
import 'package:fizjo/models/exercise-set-detailed.dart';
import 'package:fizjo/models/exercise-set.dart';
import '../env.dart';

class ExercisesSetsApi {
  Future<List<ExerciseSet>> fetchExercisesSets() async {
    var dio = Dio();
    final response = await dio.get<List<dynamic>>('${apiUrl}exercises-sets');
    return response.data?.map((exerciseSetJson) => ExerciseSet.fromJson(exerciseSetJson)).toList() ?? [];
  }

  Future<ExerciseSetDetailed> fetchExerciseSet(String id) async {
    var dio = Dio();
    final response = await dio.get<dynamic>('${apiUrl}exercises-sets/$id');
    return ExerciseSetDetailed.fromJson(response.data);
  }
}