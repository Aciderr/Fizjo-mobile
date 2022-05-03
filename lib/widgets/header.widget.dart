import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final Widget? customLeftWidget;
  final String title;
  final Widget? customRightWidget;

  const Header({
    Key? key,
    this.customLeftWidget,
    required this.title,
    this.customRightWidget
  }): super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Widget leftWidget = widget.customLeftWidget ?? Container();
    Widget rightWidget = widget.customRightWidget ?? Container();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftWidget,
          Text(widget.title, style: const TextStyle(fontSize: 17),),
          rightWidget
        ],
      ),
    );
  }
}

