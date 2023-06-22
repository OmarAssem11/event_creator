import 'package:event_creator/features/cars/domain/entities/car_option.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CarOptionDropDownButton extends StatefulWidget {
  const CarOptionDropDownButton({required this.onChanged});

  final void Function(CarOption) onChanged;

  @override
  State<CarOptionDropDownButton> createState() =>
      _CarOptionDropDownButtonState();
}

class _CarOptionDropDownButtonState extends State<CarOptionDropDownButton> {
  final _carOptions = CarOption.values;
  late CarOption _selectedType = _carOptions.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.grey, width: Sizes.s2),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.s8)),
      ),
      child: DropdownButton<CarOption>(
        value: _selectedType,
        items: _carOptions
            .map(
              (carOption) => DropdownMenuItem<CarOption>(
                value: carOption,
                child: Text(carOption.text),
              ),
            )
            .toList(),
        onChanged: (selectedCarOption) {
          if (selectedCarOption != null) {
            setState(() {
              _selectedType = selectedCarOption;
              widget.onChanged(selectedCarOption);
            });
          }
        },
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: Insets.m),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.s8)),
      ),
    );
  }
}
