import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/widgets/date_and_event_type_selector.dart';
import 'package:event_creator/features/halls/presentation/widgets/hairdresser_selector.dart';
import 'package:event_creator/features/halls/presentation/widgets/photographer_selector.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallBookingScreen extends StatefulWidget {
  const HallBookingScreen();

  @override
  State<HallBookingScreen> createState() => _HallBookingScreenState();
}

class _HallBookingScreenState extends State<HallBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.hallBooking),
      ),
      body: PageView(
        controller: BlocProvider.of<HallsCubit>(context).pageController,
        children: const [
          DateAndEventTypeSelector(),
          HairdresserSelector(),
          PhotographerSelector(),
        ],
      ),
    );
  }
}
