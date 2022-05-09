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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('redirect'),
        ),
        const Header(title: 'Kategorie'),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          children: const [
            CategoryScreen(image: 'assets/categories/back.png', text: 'Plecy', isOnlyPremium: false,),
            CategoryScreen(image: 'assets/categories/face.png', text: 'Twarz', isOnlyPremium: true,),
            CategoryScreen(image: 'assets/categories/lower_back.png', text: 'Odcinek lędźwiowy', isOnlyPremium: true),
            CategoryScreen(image: 'assets/categories/neck.png', text: 'Szyja', isOnlyPremium: true),
          ],
        )
      ],);
  }
}

