import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fizjo/main_test_context.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e test', () {
    testWidgets('Exercise progress widget should be visible and displays 1 z 4', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      var progressCounterKey = find.byKey(const Key('exercise-progress-widget'));
      var progressCounterTextKey = find.byKey(const Key('exercise-progress-counter'));
      var progressCounterText = find.text("1 z 4");

      expect(progressCounterKey, findsOneWidget);
      expect(progressCounterTextKey, findsOneWidget);
      expect(progressCounterText, findsOneWidget);
    });
  });
}