import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fizjo/main_test_context.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e test', () {
    testWidgets('Add notification.', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.notifications_none_outlined));
      await tester.pumpAndSettle();

      var initialNotificationsCount = find.byKey(const Key('notification-entry')).evaluate().length;

      var addNotificationButton = find.byKey(const Key('add-notification-button'));
      await tester.tap(addNotificationButton);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('day-picker-W')));
      await tester.tap(find.byKey(const Key('day-picker-N')));
      await tester.tap(find.text('DODAJ'));
      await tester.pumpAndSettle();

      var endNotificationsCount = find.byKey(const Key('notification-entry')).evaluate().length;
      await tester.pumpAndSettle();

      Text pnDay = tester.firstWidget(find.byKey(const Key('selected_day_P')));
      expect(pnDay.style?.color, isNot(Colors.grey));

      Text wtDay = tester.firstWidget(find.byKey(const Key('selected_day_W')));
      expect(wtDay.style?.color, equals(Colors.grey));

      Text srDay = tester.firstWidget(find.byKey(const Key('selected_day_Ś')));
      expect(srDay.style?.color, isNot(Colors.grey));

      Text czDay = tester.firstWidget(find.byKey(const Key('selected_day_C')));
      expect(czDay.style?.color, isNot(Colors.grey));

      // expect((find.byKey(const Key('selected_day_P')).evaluate().single.widget as Text).style?.color, equals(Colors.grey));

      Text sobDay = tester.firstWidget(find.byKey(const Key('selected_day_S')));
      expect(sobDay.style?.color, equals(Colors.grey));

      Text ndDay = tester.firstWidget(find.byKey(const Key('selected_day_N')));
      expect(ndDay.style?.color, isNot(Colors.grey));

      expect(addNotificationButton, findsOneWidget);
      expect(endNotificationsCount, equals(initialNotificationsCount + 1));
    });
  });
}