import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/toast.dart';
import 'package:event_creator/ui/widgets/date_selector.dart';
import 'package:event_creator/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarBookingScreen extends StatefulWidget {
  const CarBookingScreen();

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  late final CarsCubit _carsCubit;

  @override
  void initState() {
    super.initState();
    _carsCubit = BlocProvider.of<CarsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.carBooking),
        actions: [
          TextButton(
            onPressed: () => _carsCubit.bookCar(),
            child: Text(S.current.book),
          ),
          const SizedBox(width: Sizes.s8),
        ],
      ),
      body: BlocConsumer<CarsCubit, CarsState>(
        listener: (_, state) {
          if (state is BookCarSuccess) {
            showToast(S.current.bookedSuccessfully);
            context.pop();
          }
        },
        builder: (context, state) {
          if (state is CarsLoading) {
            return const LoadingIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.xxl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.current.pickupDate),
                  const SizedBox(height: Sizes.s8),
                  DateSelector(
                    onDateSelected: (selectedDate) =>
                        _carsCubit.carBookingData.startDate = selectedDate,
                  ),
                  const SizedBox(height: Sizes.s20),
                  Text(S.current.returnDate),
                  const SizedBox(height: Sizes.s12),
                  DateSelector(
                    onDateSelected: (selectedDate) =>
                        _carsCubit.carBookingData.endDate = selectedDate,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
