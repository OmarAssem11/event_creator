import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DateSelector(
          onDateSelected: (selectedDate) =>
              _hallsCubit.hallBookingData.date = selectedDate,
        ),
      ],
    );
  }
}
