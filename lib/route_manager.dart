import 'package:event_creator/features/auth/presentation/screens/email_password_login_screen.dart';
import 'package:event_creator/features/auth/presentation/screens/register_screen.dart';
import 'package:event_creator/features/more/presentation/screens/about_us_screen.dart';
import 'package:event_creator/features/more/presentation/screens/contact_us_screen.dart';
import 'package:event_creator/ui/layout/home_layout.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String home = '/';
  static const String register = '/register';
  static const String emailPasswordLogin = '/emailPasswordLogin';
  static const String contactUs = 'contactUs';
  static const String aboutUs = 'aboutUs';
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.home,
      path: Routes.home,
      builder: (_, __) => const HomeLayout(),
      routes: [
        GoRoute(
          name: Routes.contactUs,
          path: Routes.contactUs,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: ContactUsScreen()),
        ),
        GoRoute(
          name: Routes.aboutUs,
          path: Routes.aboutUs,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: AboutUsScreen()),
        ),
      ],
    ),
    GoRoute(
      name: Routes.register,
      path: Routes.register,
      pageBuilder: (_, __) => const NoTransitionPage(child: RegisterScreen()),
    ),
    GoRoute(
      name: Routes.emailPasswordLogin,
      path: Routes.emailPasswordLogin,
      pageBuilder: (_, __) =>
          const NoTransitionPage(child: EmailPasswordLoginScreen()),
    ),
  ],
);
