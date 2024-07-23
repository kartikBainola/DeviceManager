import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/routes/app.routes.dart';
import 'package:device_manager/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCNRvroB-UtaZqniLoxpXFi8cDnLRobpD4",
          appId: "1:408476104665:android:155c02a85e1b9036874bc8",
          messagingSenderId: "408476104665",
          projectId: "flicky-dd502"));

  runApp(const ProviderScope(child: HomeAutomationApp()));
}

class HomeAutomationApp extends ConsumerWidget {
  const HomeAutomationApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Home Automation',
      theme: HomeAutomationTheme.light,
      darkTheme: HomeAutomationTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
