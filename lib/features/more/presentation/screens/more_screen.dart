import 'package:event_creator/features/auth/presentation/widgets/logout_alert.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.contact_mail_outlined),
          title: Text(S.current.contactUs),
          onTap: () => context.pushNamed(Routes.contactUs),
        ),
        ListTile(
          leading: const Icon(Icons.people_alt_outlined),
          title: Text(S.current.aboutUs),
          onTap: () => context.pushNamed(Routes.aboutUs),
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: Text(S.current.logout),
          onTap: () => showDialog(
            context: context,
            builder: (_) => const LogoutAlertDialog(),
          ),
        ),
      ],
    );
  }
}
