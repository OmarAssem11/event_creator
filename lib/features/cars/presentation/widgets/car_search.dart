import 'package:event_creator/features/cars/domain/entities/car_brand.dart';
import 'package:event_creator/features/cars/domain/entities/car_option.dart';
import 'package:event_creator/features/cars/domain/entities/cars_filter.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_brand_drop_down_button.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_option_drop_down_button.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/date_selector.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:event_creator/ui/widgets/default_text_form_field.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarsSearch extends StatefulWidget {
  const CarsSearch();

  @override
  State<CarsSearch> createState() => _CarsSearchState();
}

class _CarsSearchState extends State<CarsSearch> {
  final _formKey = GlobalKey<FormState>();
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
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
              CarBrandDropDownButton(
                onChanged: (carBrand) => _selectedCarBrand = carBrand,
              ),
              const SizedBox(height: Sizes.s12),
              CarOptionDropDownButton(
                onChanged: (carOption) => _selectedCarOption = carOption,
              ),
              const SizedBox(height: Sizes.s12),
              Row(
                children: [
                  Expanded(
                    child: DefaultTextFormField(
                      controller: _minPriceController,
                      hintText: S.current.minPrice,
                      keyboardType: TextInputType.number,
                      validator: (minPrice) =>
                          validateRegularText(minPrice, S.current.minPrice),
                    ),
                  ),
                  const SizedBox(width: Sizes.s8),
                  Expanded(
                    child: DefaultTextFormField(
                      controller: _maxPriceController,
                      hintText: S.current.maxPrice,
                      keyboardType: TextInputType.number,
                      validator: (maxPrice) =>
                          validateRegularText(maxPrice, S.current.maxPrice),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Sizes.s24),
              BlocConsumer<CarsCubit, CarsState>(
                listener: (_, state) {
                  _isLoading = state is CarsLoading;
                  if (state is FilterCarsSuccess) {
                    context.pop();
                    context.pushNamed(Routes.carsSearchResultsScreen);
                  }
                },
                builder: (context, state) {
                  return DefaultElevatedButton(
                    label: S.current.search,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        BlocProvider.of<CarsCubit>(context).filterCars(
                          CarsFilter(
                            startDate: _selectedStartDate,
                            endDate: _selectedEndDate,
                            brand: _selectedCarBrand,
                            option: _selectedCarOption,
                            minPrice: double.parse(_minPriceController.text),
                            maxPrice: double.parse(_maxPriceController.text),
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

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }
}
