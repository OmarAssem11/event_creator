import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class HallRatingBar extends StatefulWidget {
  const HallRatingBar({required this.hallId});

  final String hallId;

  @override
  State<HallRatingBar> createState() => _HallRatingBarState();
}

class _HallRatingBarState extends State<HallRatingBar> {
  double _rating = 3;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.s20)),
      ),
      content: Container(
        color: ColorPalette.white,
        padding: const EdgeInsets.all(Sizes.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.rateThisHall,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Sizes.s16),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              allowHalfRating: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: ColorPalette.gold,
              ),
              onRatingUpdate: (updatedRating) {
                _rating = updatedRating;
              },
            ),
            const SizedBox(height: Sizes.s24),
            BlocConsumer<HallsCubit, HallsState>(
              listener: (_, state) {
                _isLoading = state is HallsLoading;
                if (state is RateHallSuccess) context.pop();
              },
              builder: (context, state) {
                return DefaultElevatedButton(
                  label: S.current.submit,
                  onPressed: () => BlocProvider.of<HallsCubit>(context)
                      .rateHall(hallId: widget.hallId, rating: _rating),
                  isLoading: _isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
