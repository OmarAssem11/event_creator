import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({required this.onDateSelected});

  final Function(DateTime) onDateSelected;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime _selectedDate = DateTime.now();
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDateDialog,
      child: Container(
        padding: const EdgeInsets.all(Insets.s),
        decoration: BoxDecoration(
          border: Border.all(color: ColorPalette.grey, width: Sizes.s2),
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.s8)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.date_range,
              size: Sizes.s20,
              color: _theme.primaryColor,
            ),
            const SizedBox(width: Sizes.s8),
            Text(
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: _theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDateDialog() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
        widget.onDateSelected(date);
      });
    }
  }
}
