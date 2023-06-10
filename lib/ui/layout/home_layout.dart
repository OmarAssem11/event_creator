import 'package:event_creator/di/injection_container.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/screens/cars_screen.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/screens/halls_screen.dart';
import 'package:event_creator/more_screen.dart';
import 'package:event_creator/offers_screen.dart';
import 'package:event_creator/ui/layout/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    BlocProvider(
      create: (_) => getIt<HallsCubit>(),
      child: const HallsScreen(),
    ),
    BlocProvider(
      create: (_) => getIt<CarsCubit>(),
      child: const CarsScreen(),
    ),
    const OffersScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
