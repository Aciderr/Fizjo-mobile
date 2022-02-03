import 'package:fizjo/models/exercise-set.dart';
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
    Provider.of<ExercisesSetsProvider>(context, listen: false).fetchExercisesSets();
    super.initState();
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

            if (exerciseSetId == null) {
              Provider.of<SelectedExerciseSetProvider>(context, listen: false).setExercisesSets(exercisesSetsProvider.exercisesSets[0].id);
            }

            return DropdownButton<String>(
              value: exerciseSetId ?? exercisesSetsProvider.exercisesSets[0].id,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                if (newValue == null ){
                  return;
                }
                Provider.of<SelectedExerciseSetProvider>(context, listen: false).setExercisesSets(newValue);
              },
              items: exercisesSetsProvider.exercisesSets.map<DropdownMenuItem<String>>((ExerciseSet exerciseSet) {
                return DropdownMenuItem<String>(
                  value: exerciseSet.id,
                  child: Text(exerciseSet.name),
                );
              }).toList(),
            );
          })
        ],
      ),
    );
  }
}

