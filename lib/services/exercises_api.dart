import 'package:dio/dio.dart';
import 'package:fizjo/models/exercise.dart';
import '../env.dart';

class ExercisesApi {
  static Future<List<Exercise>> fetchExercises() async {
    var dio = Dio();
    final response = await dio.get<List<dynamic>>('${apiUrl}exercises');
    return response.data?.map((exerciseJson) => Exercise.fromJson(exerciseJson)).toList() ?? [];
  }
}