import 'package:event_creator/di/injection_container.dart';
import 'package:event_creator/features/auth/presentation/screens/email_password_login_screen.dart';
import 'package:event_creator/features/auth/presentation/screens/register_screen.dart';
import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/presentation/screens/car_booking_screen.dart';
import 'package:event_creator/features/cars/presentation/screens/car_details_screen.dart';
import 'package:event_creator/features/cars/presentation/screens/cars_search_results_screen.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/presentation/screens/hall_booking_screen.dart';
import 'package:event_creator/features/halls/presentation/screens/hall_details_screen.dart';
import 'package:event_creator/features/halls/presentation/screens/halls_search_results_screen.dart';
import 'package:event_creator/features/more/presentation/cubit/more_cubit.dart';
import 'package:event_creator/features/more/presentation/screens/about_us_screen.dart';
import 'package:event_creator/features/more/presentation/screens/contact_us_screen.dart';
import 'package:event_creator/ui/layout/home_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String register = '/';
  static const String emailPasswordLogin = '/email-password-login';
  static const String home = '/home';
  static const String contactUs = 'contactUs';
  static const String aboutUs = 'aboutUs';
  static const String hallDetails = 'hall-details';
  static const String carDetails = 'car-details';
  static const String hallBooking = 'hall-booking';
  static const String carBooking = 'car-booking';
  static const String hallsSearchResultsScreen = 'halls-search-results';
  static const String carsSearchResultsScreen = 'cars-search-results';
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.home,
      path: Routes.home,
      builder: (_, __) => const HomeLayout(),
      routes: [
        GoRoute(
          name: Routes.hallsSearchResultsScreen,
          path: Routes.hallsSearchResultsScreen,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: HallsSearchResultsScreen()),
        ),
        GoRoute(
          name: Routes.carsSearchResultsScreen,
          path: Routes.carsSearchResultsScreen,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: CarsSearchResultsScreen()),
        ),
        GoRoute(
          name: Routes.contactUs,
          path: Routes.contactUs,
          pageBuilder: (_, __) => NoTransitionPage(
            child: BlocProvider(
              create: (_) => getIt<MoreCubit>(),
              child: const ContactUsScreen(),
            ),
          ),
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
        GoRoute(
          name: Routes.hallBooking,
          path: Routes.hallBooking,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: HallBookingScreen()),
        ),
        GoRoute(
          name: Routes.carBooking,
          path: Routes.carBooking,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: CarBookingScreen()),
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
