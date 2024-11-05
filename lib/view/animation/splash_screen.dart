import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/bloc/splash/splash_bloc.dart';
import 'package:pokemon/bloc/splash/splash_event.dart';
import 'package:pokemon/bloc/splash/splash_state.dart';
import 'package:pokemon/view/home/pokemon_view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(StartSplash());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>  PokemonSearchScreen())
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 800),
            child: SizedBox.expand( 
              child: Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset(
                    'assets/loading.json',
                    fit: BoxFit.cover,  
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}