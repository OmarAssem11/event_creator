import 'package:event_creator/features/cars/domain/entities/car_brand.dart';
import 'package:event_creator/features/cars/domain/entities/car_option.dart';
import 'package:event_creator/features/cars/domain/entities/cars_search_data.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_brand_dropdown_button.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_option_dropdown_button.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/date_selector.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarsSearchDialog extends StatefulWidget {
  const CarsSearchDialog();

  @override
  State<CarsSearchDialog> createState() => _CarsSearchDialogState();
}

class _CarsSearchDialogState extends State<CarsSearchDialog> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  CarBrand _selectedCarBrand = CarBrand.volvo;
  CarOption _selectedCarOption = CarOption.gpsNavigator;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.s16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.xxl),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.current.pickupDate),
                        const SizedBox(height: Sizes.s4),
                        DateSelector(
                          onDateSelected: (date) => _selectedStartDate = date,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Sizes.s8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.current.returnDate),
                        const SizedBox(height: Sizes.s4),
                        DateSelector(
                          onDateSelected: (date) => _selectedEndDate = date,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Sizes.s12),
              CarBrandDropdownButton(
                onChanged: (carBrand) => _selectedCarBrand = carBrand,
              ),
              const SizedBox(height: Sizes.s12),
              CarOptionDropdownButton(
                onChanged: (carOption) => _selectedCarOption = carOption,
              ),
              const SizedBox(height: Sizes.s24),
              BlocConsumer<CarsCubit, CarsState>(
                listener: (_, state) {
                  _isLoading = state is CarsLoading;
                  if (state is SearchCarsSuccess) {
                    context.pop();
                    context.pushNamed(Routes.carsSearchResultsScreen);
                  }
                },
                builder: (context, state) {
                  return DefaultElevatedButton(
                    label: S.current.search,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        BlocProvider.of<CarsCubit>(context).searchCars(
                          CarsSearchData(
                            startDate: _selectedStartDate,
                            endDate: _selectedEndDate,
                            brand: _selectedCarBrand,
                            option: _selectedCarOption,
                          ),
                        );
                      }
                    },
                    isLoading: _isLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
