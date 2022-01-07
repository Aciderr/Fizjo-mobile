import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/widgets/exercise.widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class ExercisesCarouselWidget extends StatefulWidget {
  const ExercisesCarouselWidget({Key? key}) : super(key: key);

  @override
  ExerciseCarouselState createState() => ExerciseCarouselState();
}

class ExerciseCarouselState extends State<ExercisesCarouselWidget> {

  @override
  void initState() {
    Provider.of<ExercisesProvider>(context, listen: false).fetchExercises();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 160;

    return Consumer<ExercisesProvider>(
        builder: (_, exercisesProvider, child) {
          if (exercisesProvider.exercises.isEmpty) {
            return Container();
          }

          return CarouselSlider(
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: height,
                onPageChanged: (currentPage, reason) {
                  Provider.of<CurrentExerciseProvider>(context, listen: false).setCurrentExercise(currentPage + 1);
                }
            ),
            items: exercisesProvider.exercises.map((exercise) => ExerciseWidget(exercise: exercise)).toList(),
          );
    });
  }
}

