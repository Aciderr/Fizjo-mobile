import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fizjo/main_test_context.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e ', () {
    testWidgets('Exercise selector.', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      var exerciseSetDropdown = find.byKey(const Key('exercise-set-dropdown'));
      await tester.tap(exerciseSetDropdown);

      var exerciseSetDropdownOption = find.byKey(const Key('exercise-set-Zestaw 1'));
      await tester.pumpAndSettle();

      expect(exerciseSetDropdownOption, findsWidgets);
    });
  });
}