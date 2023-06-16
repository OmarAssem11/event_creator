import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:event_creator/ui/widgets/default_text_form_field.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:flutter/material.dart';

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
              DefaultElevatedButton(
                label: S.current.search,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
