import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_item.dart';
import 'package:event_creator/ui/widgets/error_indicator.dart';
import 'package:event_creator/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen();

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  bool _carsLoaded = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CarsCubit>(context).getAllCars();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsCubit, CarsState>(
      buildWhen: (_, __) => !_carsLoaded,
      builder: (context, state) {
        if (state is CarsLoading) {
          return const LoadingIndicator();
        } else if (state is CarsError) {
          return const ErrorIndicator();
        } else if (state is GetAllCarsSuccess) {
          _carsLoaded = true;
          return ListView.builder(
            itemBuilder: (_, index) => CarItem(state.cars[index]),
            itemCount: state.cars.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
