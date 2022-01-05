import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/widgets/exercise.widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class ExercisesCarouselWidget extends StatelessWidget {
  const ExercisesCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 160;

    return FutureBuilder<List<Exercise>>(
      future: Provider.of<ExercisesProvider>(context, listen: false).fetchExercises(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container();
        }

        List<Exercise> exercises = snapshot.data ?? [];

        return CarouselSlider(
          options: CarouselOptions(
              enableInfiniteScroll: false,
              height: height,
              onPageChanged: (currentPage, reason) {
                Provider.of<CurrentExerciseProvider>(context, listen: false).setCurrentExercise(currentPage + 1);
              }
          ),
          items: exercises.map((exercise) => ExerciseWidget(exercise: exercise)).toList(),
        );
      },
    );
  }
}

