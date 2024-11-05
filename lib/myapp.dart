import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon/bloc/splash/splash_bloc.dart';
import 'package:pokemon/service/pokemon_service.dart';
import 'package:pokemon/view/animation/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => PokemonBloc(ApiService())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon',
        home: SplashScreen(),
      ),
    );
  }
}
