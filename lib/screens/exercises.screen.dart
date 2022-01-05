import 'package:fizjo/widgets/exercise_progress.widget.dart';
import 'package:fizjo/widgets/exercises_carousel.widget.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          ExerciseProgressWidget(key: Key('exercise-progress-widget'),),
          ExercisesCarouselWidget()
        ],
      ),
      padding: const EdgeInsets.only(bottom: 16),
    );
  }
}

