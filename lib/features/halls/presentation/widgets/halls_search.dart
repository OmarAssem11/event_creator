import 'package:event_creator/features/halls/domain/entities/halls_search_data.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
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

class HallsSearchDialog extends StatefulWidget {
  const HallsSearchDialog();

  @override
  State<HallsSearchDialog> createState() => _HallsSearchDialogState();
}

class _HallsSearchDialogState extends State<HallsSearchDialog> {
  final _formKey = GlobalKey<FormState>();
  final _numOfPeoplesController = TextEditingController();
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
                controller: _numOfPeoplesController,
                hintText: S.current.numberOfPeoples,
                keyboardType: TextInputType.number,
                validator: (numOfPeoples) => validateRegularText(
                  numOfPeoples,
                  S.current.numberOfPeoples,
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
              BlocConsumer<HallsCubit, HallsState>(
                listener: (_, state) {
                  _isLoading = state is HallsLoading;
                  if (state is FilterHallsSuccess) {
                    context.pop();
                    context.pushNamed(Routes.hallsSearchResultsScreen);
                  }
                },
                builder: (context, state) {
                  return DefaultElevatedButton(
                    label: S.current.search,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        BlocProvider.of<HallsCubit>(context).filterHalls(
                          HallsSearchData(
                            date: _selectedDate,
                            minPrice: double.parse(_minPriceController.text),
                            maxPrice: double.parse(_maxPriceController.text),
                            numOfPeople:
                                int.parse(_numOfPeoplesController.text),
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
    _numOfPeoplesController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }
}
