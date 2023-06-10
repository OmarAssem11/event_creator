import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.contactUs),
      ),
      body: const Column(),
    );
  }
}
