import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/widgets/exercise-selector.widget.dart';
import 'package:fizjo/widgets/exercise_progress.widget.dart';
import 'package:fizjo/widgets/exercises_carousel.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<CurrentExerciseProvider>(context, listen: false).setCurrentExercise(1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          ExerciseSelectorWidget(),
          ExerciseProgressWidget(key: Key('exercise-progress-widget'),),
          ExercisesCarouselWidget(),
          SizedBox(height: 16,)
        ],
      ),
    );
  }
}

