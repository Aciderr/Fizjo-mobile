import 'package:fizjo/env.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/selected-exercise-set.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseProgressWidget extends StatelessWidget {
  const ExerciseProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedExerciseSetProvider>(
      builder: (_, selectedExerciseSetProvider, child) {
        int? exercisesCount = selectedExerciseSetProvider.exerciseSet?.exercises.length;
        if (exercisesCount == null || exercisesCount == 0) {
          return Container();
        }

        return Consumer<CurrentExerciseProvider>(
          builder: (_, currentExerciseProvider, child) {
            return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 16),
                    child: Text(
                      '${currentExerciseProvider.currentExercise} z $exercisesCount',
                      key: const Key('exercise-progress-counter'),
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.success
                      )
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 40, right: 40),
                      child: LinearProgressIndicator(
                        minHeight: 4,
                        value: currentExerciseProvider.currentExercise / exercisesCount,
                        color: AppColors.success,
                        backgroundColor: AppColors.successBright,
                      )
                  ),
            ]);
          }
        );
      },
    );
  }
}