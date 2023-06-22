import 'package:event_creator/features/cars/domain/entities/car_brand.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CarBrandDropDownButton extends StatefulWidget {
  const CarBrandDropDownButton({required this.onChanged});

  final void Function(CarBrand) onChanged;

  @override
  State<CarBrandDropDownButton> createState() => _CarBrandDropDownButtonState();
}

class _CarBrandDropDownButtonState extends State<CarBrandDropDownButton> {
  final _carBrands = CarBrand.values;
  late CarBrand _selectedType = _carBrands.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.grey, width: Sizes.s2),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.s8)),
      ),
      child: DropdownButton<CarBrand>(
        value: _selectedType,
        items: _carBrands
            .map(
              (carBrand) => DropdownMenuItem<CarBrand>(
                value: carBrand,
                child: Text(carBrand.text),
              ),
            )
            .toList(),
        onChanged: (selectedCarBrand) {
          if (selectedCarBrand != null) {
            setState(() {
              _selectedType = selectedCarBrand;
              widget.onChanged(selectedCarBrand);
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
