import 'package:integration_test/integration_test.dart';
import 'min_8_add_notification.dart' as min8;
import 'min_3_exercises_carousel.dart' as min3;
import 'min_5_progress_bar.dart' as min5;
import 'min_7_notifications_list.dart' as min7;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  min8.main();
  min3.main();
  min5.main();
  min7.main();
}