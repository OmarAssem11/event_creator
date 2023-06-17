import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BookingPagesControl extends StatefulWidget {
  const BookingPagesControl();

  @override
  State<BookingPagesControl> createState() => _BookingPagesControlState();
}

class _BookingPagesControlState extends State<BookingPagesControl> {
  late final HallsCubit _hallsCubit;
  int _currentPageIndex = 0;
  String _secondButtonLabel = S.current.next;

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
              _currentPageIndex--;
              setState(() {
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
          offset: _currentPageIndex.toDouble(),
          count: 3,
          size: const Size(Sizes.s60, Sizes.s16),
        ),
        TextButton(
          onPressed: () {
            if (_currentPageIndex == 2) {
              _hallsCubit.bookHall();
            } else {
              if (_currentPageIndex == 1) _secondButtonLabel = S.current.book;
              _currentPageIndex++;
              _hallsCubit.pageController.nextPage(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            }
            setState(() {});
          },
          child: Text(_secondButtonLabel),
        ),
      ],
    );
  }
}
