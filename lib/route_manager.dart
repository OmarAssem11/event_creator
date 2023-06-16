import 'package:event_creator/features/auth/presentation/screens/email_password_login_screen.dart';
import 'package:event_creator/features/auth/presentation/screens/register_screen.dart';
import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/presentation/screens/car_details_screen.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/presentation/screens/hall_details_screen.dart';
import 'package:event_creator/features/more/presentation/screens/about_us_screen.dart';
import 'package:event_creator/features/more/presentation/screens/contact_us_screen.dart';
import 'package:event_creator/ui/layout/home_layout.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String home = '/';
  static const String register = '/register';
  static const String emailPasswordLogin = '/email-password-login';
  static const String contactUs = 'contactUs';
  static const String aboutUs = 'aboutUs';
  static const String hallDetails = 'hall-details';
  static const String carDetails = 'car-details';
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
        GoRoute(
          name: Routes.hallDetails,
          path: Routes.hallDetails,
          pageBuilder: (_, state) {
            final hall = state.extra! as Hall;
            return NoTransitionPage(child: HallDetailsScreen(hall));
          },
        ),
        GoRoute(
          name: Routes.carDetails,
          path: Routes.carDetails,
          pageBuilder: (_, state) {
            final car = state.extra! as Car;
            return NoTransitionPage(child: CarDetailsScreen(car));
          },
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
