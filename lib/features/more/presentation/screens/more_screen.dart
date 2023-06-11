import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_state.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.contact_mail_outlined,
            color: ColorPalette.darkGrey,
          ),
          title: Text(S.current.contactUs),
          onTap: () => context.pushNamed(Routes.contactUs),
        ),
        ListTile(
          leading: const Icon(
            Icons.people_alt_outlined,
            color: ColorPalette.darkGrey,
          ),
          title: Text(S.current.aboutUs),
          onTap: () => context.pushNamed(Routes.aboutUs),
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (_, state) {
            if (state is LoggedOut) context.goNamed(Routes.emailPasswordLogin);
          },
          child: ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: ColorPalette.darkGrey,
            ),
            title: Text(S.current.logout),
            onTap: BlocProvider.of<AuthCubit>(context).logout,
          ),
        ),
      ],
    );
  }
}
