import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/features/halls/presentation/widgets/hairdresser_item.dart';
import 'package:event_creator/ui/widgets/error_indicator.dart';
import 'package:event_creator/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HairdresserSelector extends StatefulWidget {
  const HairdresserSelector();

  @override
  State<HairdresserSelector> createState() => _HairdresserSelectorState();
}

class _HairdresserSelectorState extends State<HairdresserSelector> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HallsCubit>(context).getHairdressers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HallsCubit, HallsState>(
      builder: (context, state) {
        if (state is HallsLoading) {
          return const LoadingIndicator();
        } else if (state is HallsError) {
          return const ErrorIndicator();
        } else if (state is GetHairdressersSuccess) {
          final hairdressers = state.hairdressers;
          return ListView.builder(
            itemBuilder: (_, index) => HairdresserItem(hairdressers[index]),
            itemCount: hairdressers.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
