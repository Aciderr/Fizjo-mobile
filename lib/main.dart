import 'package:firebase_core/firebase_core.dart';
import 'package:fizjo/main_app.dart';
import 'package:fizjo/services/fcm_token.service.dart';
import 'package:fizjo/services/push_notification.service.dart';
import 'package:fizjo/services/service_locator.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/current-user.provider.dart';
import 'package:fizjo/providers/exercises-sets.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/providers/selected-exercise-set.provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ServiceLocatorService().initialize();
  await PushNotificationSettings().initialize();
  TokenMonitor().initialize();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CurrentExerciseProvider()),
          ChangeNotifierProvider(create: (_) => NotificationsProvider()),
          ChangeNotifierProvider(create: (_) => ExercisesProvider()),
          ChangeNotifierProvider(create: (_) => CurrentNotificationProvider()),
          ChangeNotifierProvider(create: (_) => ExercisesSetsProvider()),
          ChangeNotifierProvider(create: (_) => SelectedExerciseSetProvider()),
          ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
        ],
        child: const MyApp(),
      ));
}