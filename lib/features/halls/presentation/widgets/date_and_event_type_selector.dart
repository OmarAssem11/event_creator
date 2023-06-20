import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/widgets/event_type_drop_down_button.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateAndEventTypeSelector extends StatefulWidget {
  const DateAndEventTypeSelector();

  @override
  State<DateAndEventTypeSelector> createState() =>
      _DateAndEventTypeSelectorState();
}

class _DateAndEventTypeSelectorState extends State<DateAndEventTypeSelector> {
  late final HallsCubit _hallsCubit;

  @override
  void initState() {
    super.initState();
    _hallsCubit = BlocProvider.of<HallsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateSelector(
            onDateSelected: (selectedDate) =>
                _hallsCubit.hallBookingData.date = selectedDate,
          ),
          const SizedBox(height: Sizes.s20),
          EventTypeDropDownButton(
            onChanged: (selectedEventType) =>
                _hallsCubit.hallBookingData.eventType = selectedEventType,
          ),
        ],
      ),
    );
  }
}
