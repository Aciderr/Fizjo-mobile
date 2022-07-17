import 'package:firebase_core/firebase_core.dart';
import 'package:fizjo/main_app.dart';
import 'package:fizjo/models/exercise-set-detailed.dart';
import 'package:fizjo/models/exercise-set.dart';
import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/exercises-sets.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/providers/selected-exercise-set.provider.dart';
import 'package:fizjo/services/exercises_api.dart';
import 'package:fizjo/services/exercises_sets_api.dart';
import 'package:fizjo/services/hive_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MockExercisesApi implements ExercisesApi {
  @override
  Future<List<Exercise>> fetchExercises() async {
    return Future.value([
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc',  'abc', 'name'),
    ]);
  }
}

class MockExercisesSetsApi implements ExercisesSetsApi {
  @override
  Future<List<ExerciseSet>> fetchExercisesSets() async {
    return Future.value([
      ExerciseSet('1x2x3x4x', 'Zestaw 1'),
      ExerciseSet('1z2z3z4z', 'Zestaw 2'),
    ]);
  }

  @override
  Future<ExerciseSetDetailed> fetchExerciseSet(String id) async {
    return Future.value(
      ExerciseSetDetailed('1x2x3x4x', 'Zestaw 1', [
        Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
        Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
        Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
        Exercise('https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', 'volume 1', 'desc', 'abc', 'name'),
      ])
    );
  }
}

Future<void> main() async {
  Get.put(MockExercisesApi() as ExercisesApi);
  Get.put(MockExercisesSetsApi() as ExercisesSetsApi);
  Get.put(FizjoHive());

  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CurrentExerciseProvider()),
          ChangeNotifierProvider(create: (_) => NotificationsProvider()),
          ChangeNotifierProvider(create: (_) => ExercisesProvider()),
          ChangeNotifierProvider(create: (_) => CurrentNotificationProvider()),
          ChangeNotifierProvider(create: (_) => ExercisesSetsProvider()),
          ChangeNotifierProvider(create: (_) => SelectedExerciseSetProvider()),
          // ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
        ],
        child: const MyApp(),
      ));
}