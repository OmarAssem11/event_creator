import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: S.current.password,
        prefixIcon: Icon(
          Icons.lock_outline_rounded,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => setState(() => _isObscure = !_isObscure),
        ),
      ),
      controller: widget.controller,
      obscureText: _isObscure,
      validator: validatePassword,
      autocorrect: false,
      enableSuggestions: false,
    );
  }
}
