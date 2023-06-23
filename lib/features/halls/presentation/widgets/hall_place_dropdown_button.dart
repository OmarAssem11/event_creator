import 'package:event_creator/features/halls/domain/entities/hall_place.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HallPlaceDropdownButton extends StatefulWidget {
  const HallPlaceDropdownButton({required this.onChanged});

  final void Function(HallPlace) onChanged;

  @override
  State<HallPlaceDropdownButton> createState() =>
      _HallPlaceDropdownButtonState();
}

class _HallPlaceDropdownButtonState extends State<HallPlaceDropdownButton> {
  final _hallPlaces = HallPlace.values;
  late HallPlace _selectedType = _hallPlaces.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.grey, width: Sizes.s2),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.s8)),
      ),
      child: DropdownButton<HallPlace>(
        value: _selectedType,
        items: _hallPlaces
            .map(
              (hallPlace) => DropdownMenuItem<HallPlace>(
                value: hallPlace,
                child: Text(hallPlace.text),
              ),
            )
            .toList(),
        onChanged: (selectedHallPlace) {
          if (selectedHallPlace != null) {
            setState(() {
              _selectedType = selectedHallPlace;
              widget.onChanged(selectedHallPlace);
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
