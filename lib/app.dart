import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/auth/presentation/auth_screen.dart';
import 'features/home/presentation/home_screen.dart';

class NootidApp extends StatelessWidget {
  const NootidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nootid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.auth: (context) => const AuthScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
