import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String text;
  final String image;
  final bool isOnlyPremium;

  const CategoryScreen({
    Key? key,
    required this.text,
    required this.image,
    required this.isOnlyPremium
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
              Flexible(child: Text(widget.text, textAlign: TextAlign.center,)),
              widget.isOnlyPremium ? const Padding(padding: EdgeInsets.only(left: 5), child: Icon(Icons.lock_outline),) : Container()
            ],
          )
        ],
      ),
    ),);
  }
}

