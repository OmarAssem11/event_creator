import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<HallsCubit>(context).getHairdressers();
    BlocProvider.of<HallsCubit>(context).getPhotographers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.hallBooking),
      ),
    );
  }
}
