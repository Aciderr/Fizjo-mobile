import 'package:flutter/material.dart';

class PellaInput extends StatefulWidget {
  final String inputText;
  final TextEditingController controller;
  final bool isPassword;
  FormFieldValidator? validator;

  PellaInput({
    Key? key,
    required this.controller,
    required this.inputText,
    this.isPassword = false,
    this.validator
  }) : super(key: key);

  @override
  State<PellaInput> createState() => _PellaInputState();
}

class _PellaInputState extends State<PellaInput> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isValid ? const EdgeInsets.symmetric(vertical: 16) : const EdgeInsets.only(top: 16, bottom: 0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        validator: (value) {
          if (widget.validator != null) {
            final validationText = widget.validator!(value);
            setState(() {
              isValid = validationText == null;
            });
            return validationText;
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          hintText: widget.inputText,
        ),
      ),
    );
  }
}

