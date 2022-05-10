import 'package:firebase_core/firebase_core.dart';
import 'package:fizjo/helpers/notification_permission.dart';
import 'package:fizjo/interceptors/token.interceptor.dart';
import 'package:fizjo/main_app.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/exercises-sets.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/providers/selected-exercise-set.provider.dart';
import 'package:fizjo/services/exercises_api.dart';
import 'package:fizjo/services/exercises_sets_api.dart';
import 'package:fizjo/services/hive_api.dart';
import 'package:fizjo/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Get.put(ExercisesApi());
  Get.put(ExercisesSetsApi());
  Get.put(FizjoHive());

  await Firebase.initializeApp();
  Get.put(HttpService([TokenInterceptor(), PrettyDioLogger(requestHeader: true)]));

  WidgetsFlutterBinding.ensureInitialized();
  configureLocalNotificationsInstance();
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