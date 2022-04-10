import 'package:fizjo/models/exercise-set.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/exercises-sets.provider.dart';
import 'package:fizjo/providers/selected-exercise-set.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseSelectorWidget extends StatefulWidget {
  const ExerciseSelectorWidget({Key? key}) : super(key: key);

  @override
  State<ExerciseSelectorWidget> createState() => _ExerciseSelectorWidgetState();
}

class _ExerciseSelectorWidgetState extends State<ExerciseSelectorWidget> {
  @override
  void initState() {
    setDefaultExerciseSet();
    super.initState();
  }

  setDefaultExerciseSet() async {
    var exerciseSetId = Provider.of<SelectedExerciseSetProvider>(context, listen: false).selectedExerciseSet;
    var exercisesSets = await Provider.of<ExercisesSetsProvider>(context, listen: false).fetchExercisesSets();
    if (exerciseSetId == null) {
      Provider.of<SelectedExerciseSetProvider>(context, listen: false).setExercisesSets(exercisesSets[0].id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Consumer<ExercisesSetsProvider>(
          builder: (_, exercisesSetsProvider, child) {
            var exerciseSetId = Provider.of<SelectedExerciseSetProvider>(context).selectedExerciseSet;
            if (exercisesSetsProvider.exercisesSets.isEmpty) {
              return Container();
            }

            return DropdownButton<String>(
              key: const Key('exercise-set-dropdown'),
              value: exerciseSetId,
              underline: Container(),
              onChanged: (String? newValue) {
                if (newValue == null ){
                  return;
                }
                Provider.of<SelectedExerciseSetProvider>(context, listen: false).setExercisesSets(newValue);
                Provider.of<CurrentExerciseProvider>(context, listen: false).setCurrentExercise(1);
              },
              items: exercisesSetsProvider.exercisesSets.map<DropdownMenuItem<String>>((ExerciseSet exerciseSet) {
                return DropdownMenuItem<String>(
                  value: exerciseSet.id,
                  child: Text(exerciseSet.name),
                  key: Key('exercise-set-${exerciseSet.name}'),
                );
              }).toList(),
            );
          })
        ],
      ),
    );
  }
}

