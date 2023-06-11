import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    required this.controller,
    required this.hintText,
    this.prefixIconData,
    this.keyboardType,
    this.validator,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIconData;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIconData != null
            ? Icon(
                prefixIconData,
                color: Theme.of(context).primaryColor,
              )
            : null,
      ),
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      autocorrect: false,
    );
  }
}
