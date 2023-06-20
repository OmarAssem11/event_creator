import 'package:event_creator/features/auth/domain/entities/gender.dart';
import 'package:flutter/material.dart';

class GenderRadioButtonGroup extends StatefulWidget {
  const GenderRadioButtonGroup({required this.onChanged});

  final void Function(Gender) onChanged;

  @override
  State<GenderRadioButtonGroup> createState() => _GenderRadioButtonGroupState();
}

class _GenderRadioButtonGroupState extends State<GenderRadioButtonGroup> {
  final _genders = Gender.values;
  late Gender _selectedGender = _genders.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _genders
          .map(
            (gender) => RadioMenuButton<Gender>(
              value: gender,
              groupValue: _selectedGender,
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedGender = newValue;
                    widget.onChanged(_selectedGender);
                  });
                }
              },
              child: Text(gender.text),
            ),
          )
          .toList(),
    );
  }
}
