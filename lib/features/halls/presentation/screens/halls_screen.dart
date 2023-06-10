import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_state.dart';
import 'package:event_creator/features/halls/presentation/widgets/hall_item.dart';
import 'package:event_creator/ui/widgets/error_indicator.dart';
import 'package:event_creator/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallsScreen extends StatefulWidget {
  const HallsScreen();

  @override
  State<HallsScreen> createState() => _HallsScreenState();
}

class _HallsScreenState extends State<HallsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HallsCubit>(context).getAllHalls();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HallsCubit, HallsState>(
      builder: (context, state) {
        if (state is HallsLoading) {
          return const LoadingIndicator();
        } else if (state is HallsError) {
          return const ErrorIndicator();
        } else if (state is GetAllHallsSuccess) {
          return ListView.builder(
            itemBuilder: (_, index) => HallItem(state.halls[index]),
            itemCount: state.halls.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
