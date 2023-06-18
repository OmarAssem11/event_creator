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
  late final HallsCubit _hallsCubit;
  bool _hallsLoaded = false;

  @override
  void initState() {
    super.initState();
    _hallsCubit = BlocProvider.of<HallsCubit>(context);
    _hallsCubit.getAllHalls();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HallsCubit, HallsState>(
      buildWhen: (_, __) => !_hallsLoaded,
      builder: (context, state) {
        if (state is HallsLoading) {
          return const LoadingIndicator();
        } else if (state is HallsError) {
          return const ErrorIndicator();
        } else if (state is GetAllHallsSuccess) {
          _hallsLoaded = true;
          return ListView.builder(
            itemBuilder: (_, index) => HallItem(_hallsCubit.allHalls[index]),
            itemCount: _hallsCubit.allHalls.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
