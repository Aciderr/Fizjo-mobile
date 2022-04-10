import 'dart:async';

import 'package:fizjo/models/exercise-set-detailed.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/selected-exercise-set.provider.dart';
import 'package:fizjo/widgets/exercise.widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class ExercisesCarouselWidget extends StatelessWidget {
  const ExercisesCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();
    double height = MediaQuery.of(context).size.height - 160;

    return Selector<SelectedExerciseSetProvider, ExerciseSetDetailed?>(
        selector: (_, provider) => provider.exerciseSet,
        builder: (_, exerciseSet, child) {
          if (exerciseSet == null) {
            return Container();
          }

          Timer(const Duration(seconds: 0), () {
            carouselController.jumpToPage(0);
          });
          return CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: height,
                onPageChanged: (currentPage, reason) {
                  Provider.of<CurrentExerciseProvider>(context, listen: false)
                      .setCurrentExercise(currentPage + 1);
                }),
            items: exerciseSet.exercises
                .map((exercise) => ExerciseWidget(exercise: exercise))
                .toList(),
          );
        });
  }
}