import 'package:fizjo/env.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseProgressWidget extends StatelessWidget {
  const ExerciseProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExercisesProvider>(
      builder: (_, exercisesProvider, child) {
        int exercisesCount = exercisesProvider.exercises.length;

        return exercisesCount > 0 ? Consumer<CurrentExerciseProvider>(
          builder: (_, currentExerciseProvider, child) {
            return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 16),
                    child: Text(
                      '${currentExerciseProvider.currentExercise} z $exercisesCount',
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
        ) : Container();
      },
    );
  }
}