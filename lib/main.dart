import 'package:event_creator/di/injection_container.dart';
import 'package:event_creator/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = AppBlocObserver();
  runApp(const EventCreator());
}

class EventCreator extends StatelessWidget {
  const EventCreator();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthCubit>()..getAuthStatus(),
        ),
        BlocProvider(
          create: (_) => getIt<HallsCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<CarsCubit>(),
        ),
      ],
      child: GestureDetector(
        onTap: WidgetsBinding.instance.focusManager.primaryFocus?.unfocus,
        child: MaterialApp.router(
          title: 'Event Creator',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: getTheme(),
          themeMode: ThemeMode.light,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('en'),
        ),
      ),
    );
  }
}
