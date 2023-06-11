import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.aboutUs),
      ),
      body: const Column(),
    );
  }
}
