import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String text;
  final String image;

  const CategoryScreen({
    Key? key,
    required this.text,
    required this.image
  }): super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Center(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Image.asset(widget.image),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Text(widget.text, textAlign: TextAlign.center,))
            ],
          )
        ],
      ),
    ),);
  }
}

