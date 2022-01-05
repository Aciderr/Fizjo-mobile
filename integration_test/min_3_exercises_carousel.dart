import 'package:carousel_slider/carousel_slider.dart';
import 'package:fizjo/widgets/exercise.widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fizjo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e test', () {
    testWidgets('Carousel slider should be visible.', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 1000));
      var carousel = find.byType(CarouselSlider);
      var exercises = find.byType(ExerciseWidget);
      // await tester.drag(exercises, const Offset(400, 0.0));

      expect(carousel, findsOneWidget);
      expect(exercises, findsNWidgets(2));
    });
  });
}