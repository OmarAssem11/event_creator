import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/features/halls/presentation/widgets/date_and_event_type_selector.dart';
import 'package:event_creator/features/halls/presentation/widgets/hairdresser_selector.dart';
import 'package:event_creator/features/halls/presentation/widgets/photographer_selector.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/toast.dart';
import 'package:event_creator/ui/widgets/booking_pages_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        title: const BookingPagesControl(),
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<HallsCubit, HallsState>(
        listener: (_, state) {
          if (state is BookHallSuccess) {
            showToast(S.current.bookedSuccessfully);
            context.pop();
          }
        },
        child: PageView(
          controller: BlocProvider.of<HallsCubit>(context).pageController,
          children: const [
            DateAndEventTypeSelector(),
            HairdresserSelector(),
            PhotographerSelector(),
          ],
        ),
      ),
    );
  }
}
