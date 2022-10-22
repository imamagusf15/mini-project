import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';

class InputFormField extends StatefulWidget {
  const InputFormField({
    super.key,
    required this.hintText,
    required this.helperText,
    required this.obscureText,
    required this.suffixIcon,
  });

  final String hintText;
  final String helperText;
  final Widget suffixIcon;
  final bool obscureText;

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.neutralColor,
          ),
        ),
        suffixIcon: widget.suffixIcon,
        helperText: widget.helperText,
      ),
    );
  }
}
