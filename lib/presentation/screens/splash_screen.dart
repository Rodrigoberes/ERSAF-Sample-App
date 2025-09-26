import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/blocs/user/user_bloc.dart';
import '../../routes/route_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          if (state.users.isNotEmpty) {
            // Set the first user as current user for auto-login
            context.read<UserBloc>().add(SetCurrentUser(state.users.first));
            // User exists, go to main
            Navigator.pushReplacementNamed(context, RouteGenerator.main);
          } else {
            // No users stored, go to onboarding
            Navigator.pushReplacementNamed(context, RouteGenerator.onboarding);
          }
        } else if (state is UserError) {
          // Handle error, for now go to onboarding
          Navigator.pushReplacementNamed(context, RouteGenerator.onboarding);
        }
      },
      child: const Scaffold(
        backgroundColor: Color(0xFFF8F9FA),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                 Icons.directions_bus,
                size: 80.0,
                color: Color(0xFF667EEA),
              ),
              SizedBox(height: 16.0),
              Text(
                'ERSAF SAMPLE',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              SizedBox(height: 16.0),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF667EEA)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}