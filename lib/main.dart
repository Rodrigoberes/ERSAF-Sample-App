import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'business/blocs/route/route_bloc.dart';
import 'business/blocs/user/user_bloc.dart';
import 'business/di/injection.dart';
import 'routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logging
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
  }
  Logger.root.onRecord.listen((record) {
    var logError = '';
    if (record.error != null) {
      logError = record.error.toString();
    }
    final msg =
        '${record.level.name}: ${record.time}: ${record.message} $logError';
    debugPrint(msg);
    if (record.stackTrace != null) {
      debugPrint(record.stackTrace.toString());
    }
  });

  // Setup dependency injection
  setupInjection();

  // Initialize app
  final app = MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
        create: (context) => getIt<UserBloc>()..add(LoadUsers()),
      ),
      BlocProvider<RouteBloc>(
        create: (context) => getIt<RouteBloc>()..add(LoadRoutes()),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transport Booking',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF667EEA),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
        cardTheme: CardThemeData(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          shadowColor: Colors.black.withValues(alpha: 0.1),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            shadowColor: Colors.black.withValues(alpha: 0.2),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color(0xFF667EEA),
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF4A5568),
          ),
        ),
      ),
      initialRoute: RouteGenerator.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );

  runApp(app);
}
