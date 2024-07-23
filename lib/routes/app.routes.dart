import 'package:go_router/go_router.dart';
import 'package:device_manager/features/devices/presentation/pages/device_details.page.dart';
import 'package:device_manager/features/devices/presentation/pages/devices.page.dart';
import 'package:device_manager/features/intro/presentation/pages/loading.page.dart';
import 'package:device_manager/features/intro/presentation/pages/splash.page.dart';
import 'package:device_manager/features/landing/presentation/pages/home.page.dart';
import 'package:device_manager/features/landing/presentation/pages/landing.page.dart';
import 'package:device_manager/features/rooms/presentation/pages/rooms.page.dart';
import 'package:device_manager/features/settings/presentation/pages/settings.page.dart';
import 'package:device_manager/helpers/utils.dart';
import 'package:device_manager/features/SignIn/SignInScreen.dart';
import 'package:device_manager/features/SignIn/otpScreen.dart';

class AppRoutes {
  static final router = GoRouter(
      routerNeglect: true,
      initialLocation: SplashPage.route,
      navigatorKey: Utils.mainNav,
      routes: [
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: SplashPage.route,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: LoadingPage.route,
          builder: (context, state) {
            return const LoadingPage();
          },
        ),
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: SignInScreen.route,
          builder: (context, state) {
            return const SignInScreen();
          },
        ),
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: OTPScreen.route,
          builder: (context, state) {
            return const OTPScreen();
          },
        ),
        ShellRoute(
            navigatorKey: Utils.tabNav,
            builder: (context, state, child) {
              return LandingPage(child: child);
            },
            routes: [
              GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: HomePage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: HomePage(),
                  );
                },
              ),
              GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: RoomsPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: RoomsPage(),
                  );
                },
              ),
              GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: DevicesPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: DevicesPage(),
                  );
                },
              ),
              GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: SettingsPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: SettingsPage(),
                  );
                },
              ),
            ]),
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: DeviceDetailsPage.route,
          builder: (context, state) {
            return const DeviceDetailsPage();
          },
        ),
      ]);
}
