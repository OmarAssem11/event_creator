import 'package:event_creator/features/cars/presentation/screens/cars_screen.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_search.dart';
import 'package:event_creator/features/halls/presentation/screens/halls_screen.dart';
import 'package:event_creator/features/halls/presentation/screens/offers_screen.dart';
import 'package:event_creator/features/halls/presentation/widgets/halls_search.dart';
import 'package:event_creator/features/more/presentation/screens/more_screen.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/layout/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HallsScreen(),
    const CarsScreen(),
    const OffersScreen(),
    const MoreScreen(),
  ];
  final _titles = [
    S.current.halls,
    S.current.cars,
    S.current.offers,
    S.current.more,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          if (_currentIndex == 0 || _currentIndex == 1)
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => _currentIndex == 0
                    ? const HallsSearch()
                    : const CarsSearch(),
              ),
              icon: const Icon(Icons.search_rounded),
            ),
        ],
      ),
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
