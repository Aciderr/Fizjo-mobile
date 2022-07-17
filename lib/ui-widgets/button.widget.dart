import 'package:flutter/material.dart';

class PellaButton extends StatefulWidget {
  final String text;
  final String? suffixImagePath;
  final bool isProcessing;
  final MaterialStateProperty<Color> backgroundColor;
  final Color textColor;
  final void Function() onPressed;

  const PellaButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.suffixImagePath,
    required this.backgroundColor,
    this.textColor = Colors.black,
    this.isProcessing = false
  }) : super(key: key);

  @override
  State<PellaButton> createState() => _PellaButtonState();
}

class _PellaButtonState extends State<PellaButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: widget.backgroundColor
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isProcessing ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2,),) : Row(children: [
              Text(widget.text, style: TextStyle(color: widget.textColor),),
              widget.suffixImagePath != null ? Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset(widget.suffixImagePath!, height: 24, width: 24,),
              ) : Container()
            ],)
          ],),
      )
    );
  }
}

