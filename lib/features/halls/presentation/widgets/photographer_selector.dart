import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/features/halls/presentation/widgets/photographer_item.dart';
import 'package:event_creator/ui/widgets/error_indicator.dart';
import 'package:event_creator/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotographerSelector extends StatefulWidget {
  const PhotographerSelector();

  @override
  State<PhotographerSelector> createState() => _PhotographerSelectorState();
}

class _PhotographerSelectorState extends State<PhotographerSelector> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HallsCubit>(context).getPhotographers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HallsCubit, HallsState>(
      builder: (context, state) {
        if (state is HallsLoading) {
          return const LoadingIndicator();
        } else if (state is HallsError) {
          return const ErrorIndicator();
        } else if (state is GetPhotographersSuccess) {
          final photographers = state.photographers;
          return ListView.builder(
            itemBuilder: (_, index) => PhotographerItem(photographers[index]),
            itemCount: photographers.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
