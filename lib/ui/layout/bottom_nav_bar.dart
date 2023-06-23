import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(Sizes.s16),
        topLeft: Radius.circular(Sizes.s16),
      ),
      child: Theme(
        data: ThemeData(
          canvasColor: Theme.of(context).primaryColor,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: S.current.halls,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.car_rental),
              label: S.current.cars,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.label_outline),
              label: S.current.offers,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.more_horiz_rounded),
              label: S.current.more,
            ),
          ],
          selectedIconTheme: const IconThemeData(color: ColorPalette.black),
          unselectedIconTheme:
              IconThemeData(color: ColorPalette.darkGrey.withOpacity(.6)),
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
