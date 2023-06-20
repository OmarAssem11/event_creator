import 'package:event_creator/features/halls/domain/entities/event_type.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class EventTypeDropDownButton extends StatefulWidget {
  const EventTypeDropDownButton({required this.onChanged});

  final void Function(EventType) onChanged;

  @override
  State<EventTypeDropDownButton> createState() =>
      _EventTypeDropDownButtonState();
}

class _EventTypeDropDownButtonState extends State<EventTypeDropDownButton> {
  final _eventTypes = EventType.values;
  late EventType _selectedType = _eventTypes.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.grey, width: Sizes.s2),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.s8)),
      ),
      child: DropdownButton<EventType>(
        value: _selectedType,
        items: _eventTypes
            .map(
              (eventType) => DropdownMenuItem<EventType>(
                value: eventType,
                child: Text(eventType.text),
              ),
            )
            .toList(),
        onChanged: (selectedEventType) {
          if (selectedEventType != null) {
            setState(() {
              _selectedType = selectedEventType;
              widget.onChanged(selectedEventType);
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
