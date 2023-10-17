import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';

class InputFormField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.neutralColor,
          ),
        ),
        suffixIcon: suffixIcon,
        helperText: helperText,
      ),
    );
  }
}
