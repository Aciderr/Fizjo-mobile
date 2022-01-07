import 'package:cached_network_image/cached_network_image.dart';
import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ExerciseWidget extends StatefulWidget {
  final Exercise exercise;

  const ExerciseWidget({ Key? key, required this.exercise }) : super(key: key);

  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  final ScrollController _scrollController = ScrollController();

  void scrollToTop() {
    if (!_scrollController.hasClients) {
      return;
    }

    _scrollController.position.jumpTo(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentExerciseProvider>(builder: (_, currentExerciseProvider, child) {
      scrollToTop();

      return Card(
            semanticContainer: true,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 240,
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: widget.exercise.pictureUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.exercise.name,
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            widget.exercise.volume,
                            style: const TextStyle(
                                fontSize: 15
                            )
                        ),
                      ),
                    ),
                    Text(
                        widget.exercise.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            height: 1.4,
                            fontSize: 15
                        )
                    ),
                  ],
                ),
              ),
            ),
        );
    });
  }
}