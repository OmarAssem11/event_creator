import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';

class CarBookingScreen extends StatelessWidget {
  const CarBookingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.carBooking),
      ),
    );
  }
}
