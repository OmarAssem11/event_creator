import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_state.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<AuthCubit, AuthState>(
      listener: (_, state) {
        if (state is LoggedOut) context.goNamed(Routes.emailPasswordLogin);
      },
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s16)),
        ),
        title: Text(
          S.current.areYouSureYouWantToLogout,
          style: textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              S.current.no,
              style:
                  textTheme.titleMedium?.copyWith(color: ColorPalette.darkGrey),
            ),
          ),
          TextButton(
            onPressed: BlocProvider.of<AuthCubit>(context).logout,
            child: Text(
              S.current.yes,
              style:
                  textTheme.titleMedium?.copyWith(color: ColorPalette.darkGrey),
            ),
          ),
        ],
      ),
    );
  }
}
