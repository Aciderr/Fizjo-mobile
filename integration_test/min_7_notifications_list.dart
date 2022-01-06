import 'package:fizjo/models/notification.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fizjo/main_test_context.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e test', () {
    testWidgets('Display notification list.', (WidgetTester tester) async {
      await app.main();
      var box = await Hive.openBox<NotificationConfig>(notificationsKey);
      NotificationConfig notification1 = NotificationConfig(time: '12:00', days: [0,1,2,3,4,5], id: 1);
      NotificationConfig notification2 = NotificationConfig(time: '13:00', days: [0,1,2,3,4,5], id: 2);
      box.add(notification1);
      box.add(notification2);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Powiadomienia'));
      await tester.pumpAndSettle();

      var notificationsCount = find.byKey(const Key('notification-entry')).evaluate().length;

      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pumpAndSettle();

      var notificationsCountAfterDelete = find.byKey(const Key('notification-entry')).evaluate().length;
      expect(notificationsCountAfterDelete, notificationsCount - 1);
    });
  });
}