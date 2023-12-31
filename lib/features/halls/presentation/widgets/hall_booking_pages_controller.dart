import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HallBookingPagesController extends StatefulWidget {
  const HallBookingPagesController();

  @override
  State<HallBookingPagesController> createState() =>
      _HallBookingPagesControllerState();
}

class _HallBookingPagesControllerState
    extends State<HallBookingPagesController> {
  late final HallsCubit _hallsCubit;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _hallsCubit = BlocProvider.of<HallsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            if (_currentPageIndex == 0) {
              context.pop();
            } else {
              setState(() {
                _currentPageIndex--;
                _hallsCubit.pageController.previousPage(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );
              });
            }
          },
          child: Text(S.current.previous),
        ),
        SmoothIndicator(
          effect: WormEffect(
            activeDotColor: Theme.of(context).primaryColor,
          ),
          offset: _currentPageIndex.toDouble(),
          count: 3,
          size: const Size(Sizes.s60, Sizes.s16),
        ),
        if (_currentPageIndex == 2)
          TextButton(
            onPressed: _hallsCubit.bookHall,
            child: Text(S.current.book),
          )
        else
          TextButton(
            onPressed: () => setState(() {
              _currentPageIndex++;
              _hallsCubit.pageController.nextPage(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            }),
            child: Text(S.current.next),
          ),
      ],
    );
  }
}
