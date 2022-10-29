import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';

class DropDownField extends StatefulWidget {
  final List<String> menu;
  final String hintText;

  const DropDownField({
    super.key,
    required this.menu,
    required this.hintText,
  });

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelStyle: const TextStyle(color: CustomColors.neutralColor),
            errorStyle: const TextStyle(color: Colors.red),
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          isEmpty: (_currentSelectedValue == null) ? true : false,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _currentSelectedValue,
              isDense: true,
              onChanged: (String? newValue) {
                setState(() {
                  _currentSelectedValue = newValue;
                });
              },
              items: widget.menu.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
