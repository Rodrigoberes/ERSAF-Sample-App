import 'package:flutter/material.dart';
import '../business/models/route.dart' as route_model;
import '../presentation/screens/edit_user_screen.dart';
import '../presentation/screens/forgot_password_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/onboarding_screen.dart';
import '../presentation/screens/profile_screen.dart';
import '../presentation/screens/route_detail_screen.dart';
import '../presentation/screens/signup_screen.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/transports_screen.dart';
import '../presentation/screens/user_management_screen.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String main = '/main';
  static const String home = '/home';
  static const String editUser = '/edit-user';
  static const String userManagement = '/user-management';
  static const String transports = '/transports';
  static const String routeDetails = '/route-details';
  static const String profile = '/profile';
  static const String forgotPassword = '/forgot-password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case editUser:
        final user = settings.arguments as dynamic;
        return MaterialPageRoute(builder: (_) => EditUserScreen(user: user));
      case userManagement:
        return MaterialPageRoute(builder: (_) => const UserManagementScreen());
      case transports:
        return MaterialPageRoute(builder: (_) => const TransportsScreen());
      case routeDetails:
        final route = settings.arguments as route_model.Route;
        return MaterialPageRoute(
          builder: (_) => RouteDetailScreen(route: route),
        );
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
