import 'package:integration_test/integration_test.dart';

import 'add_notification.dart' as add_notification;
import 'exercises_carousel.dart' as exercises_carousel;
import 'progress_bar.dart' as progress_bar;
import 'notifications_list.dart' as notifications_list;
import 'exercise_selector.dart' as exercise_selector;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  add_notification.main();
  exercises_carousel.main();
  progress_bar.main();
  notifications_list.main();
  exercise_selector.main();
}