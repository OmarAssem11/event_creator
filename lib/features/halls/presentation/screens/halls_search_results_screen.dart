import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/widgets/hall_item.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallsSearchResultsScreen extends StatefulWidget {
  const HallsSearchResultsScreen();

  @override
  State<HallsSearchResultsScreen> createState() =>
      _HallsSearchResultsScreenState();
}

class _HallsSearchResultsScreenState extends State<HallsSearchResultsScreen> {
  late final List<Hall> _filteredHalls;

  @override
  void initState() {
    super.initState();
    _filteredHalls = BlocProvider.of<HallsCubit>(context).filteredHalls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.availableHalls),
      ),
      body: _filteredHalls.isEmpty
          ? Center(
              child: Text(S.current.noAvailableHalls),
            )
          : ListView.builder(
              itemBuilder: (_, index) => HallItem(_filteredHalls[index]),
              itemCount: _filteredHalls.length,
            ),
    );
  }
}
