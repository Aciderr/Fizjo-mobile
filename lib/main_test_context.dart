import 'package:firebase_core/firebase_core.dart';
import 'package:fizjo/helpers/notification_permission.dart';
import 'package:fizjo/main_app.dart';
import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/current-user.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/services/exercises_api.dart';
import 'package:fizjo/services/hive_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MockExercisesApi implements ExercisesApi {
  @override
  Future<List<Exercise>> fetchExercises() async {
    return Future.value([
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
      Exercise(pictureUrl: 'https://fizjo.s3.eu-central-1.amazonaws.com/exercises/2.png', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
    ]);
  }
}

Future<void> main() async {
  Get.put(MockExercisesApi() as ExercisesApi);
  Get.put(FizjoHive());

  Get.find<FizjoHive>().initialize();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  configureLocalNotificationsInstance();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CurrentExerciseProvider()),
          ChangeNotifierProvider(create: (_) => NotificationsProvider()),
          ChangeNotifierProvider(create: (_) => ExercisesProvider()),
          ChangeNotifierProvider(create: (_) => CurrentNotificationProvider()),
          // ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
        ],
        child: const MyApp(),
      ));
}