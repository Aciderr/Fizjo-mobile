import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/services/exercises_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fizjo/main.dart' as app;
import 'package:mockito/mockito.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e test', () {
    testWidgets('Exercise progress widget should be visible and displays 1 z 8', (WidgetTester tester) async {
          // when(ExercisesApi.fetchExercises()).thenAnswer((_) async => Future.value([
          //   Exercise(pictureUrl: 'http://', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
          //   Exercise(pictureUrl: 'http://', volume: 'volume 1', description: 'desc', id: 'abc', name: 'name'),
          // ]));

          app.main();
          await tester.pumpAndSettle();

          var progressCounterKey = find.byKey(const Key('exercise-progress-widget'));

          await tester.pump(const Duration(milliseconds: 1000));

          var progressCounterTextKey = find.byKey(const Key('exercise-progress-counter'));
          var progressCounterText = find.text("1 z 8");

          expect(progressCounterKey, findsOneWidget);
          expect(progressCounterTextKey, findsOneWidget);
          expect(progressCounterText, findsOneWidget);
        });
  });
}