import 'package:event_creator/features/cars/domain/entities/cars_filter.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_state.dart';
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
  final _modelController = TextEditingController();
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
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
            children: [
              DateSelector(onDateSelected: (date) => _selectedDate = date),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _modelController,
                hintText: S.current.model,
                keyboardType: TextInputType.text,
                validator: (model) => validateRegularText(
                  model,
                  S.current.model,
                ),
              ),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _minPriceController,
                hintText: S.current.minPrice,
                keyboardType: TextInputType.number,
                validator: (minPrice) =>
                    validateRegularText(minPrice, S.current.minPrice),
              ),
              const SizedBox(height: Sizes.s12),
              DefaultTextFormField(
                controller: _maxPriceController,
                hintText: S.current.maxPrice,
                keyboardType: TextInputType.number,
                validator: (maxPrice) =>
                    validateRegularText(maxPrice, S.current.maxPrice),
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
                            model: _modelController.text,
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
    _modelController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }
}
