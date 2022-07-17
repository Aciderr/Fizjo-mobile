import 'package:fizjo/widgets/category.widget.dart';
import 'package:fizjo/widgets/header.widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Header(title: 'Kategorie'),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            physics: const ScrollPhysics(),
            children: const [
              CategoryScreen(image: 'assets/categories/back.png', text: 'Plecy'),
              CategoryScreen(image: 'assets/categories/face.png', text: 'Twarz'),
              CategoryScreen(image: 'assets/categories/lower_back.png', text: 'Odcinek lędźwiowy'),
              CategoryScreen(image: 'assets/categories/neck.png', text: 'Szyja'),
              CategoryScreen(image: 'assets/categories/shoulders.png', text: 'Barki'),
              CategoryScreen(image: 'assets/categories/chest.png', text: 'Klatka pierściowa'),
            ],
          )
        ],)
      );
  }
}

