import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/utils/validator.dart';

class InputFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final String helperText;
  final Widget suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  const InputFormField({
    super.key,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.helperText,
    required this.obscureText,
    required this.suffixIcon,
  });

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  final validator = Validator();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
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
