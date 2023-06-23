import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_item.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsSearchResultsScreen extends StatefulWidget {
  const CarsSearchResultsScreen();

  @override
  State<CarsSearchResultsScreen> createState() =>
      _CarsSearchResultsScreenState();
}

class _CarsSearchResultsScreenState extends State<CarsSearchResultsScreen> {
  late final List<Car> _filteredCars;

  @override
  void initState() {
    super.initState();
    _filteredCars = BlocProvider.of<CarsCubit>(context).searchCarsResults;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.availableCars),
      ),
      body: _filteredCars.isEmpty
          ? Center(
              child: Text(S.current.noAvailableCars),
            )
          : ListView.builder(
              itemBuilder: (_, index) => CarItem(_filteredCars[index]),
              itemCount: _filteredCars.length,
            ),
    );
  }
}
