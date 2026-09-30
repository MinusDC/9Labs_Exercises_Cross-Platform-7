import 'package:flutter/material.dart';

import 'screens/loading_screen.dart';

void main() => runApp(const ClimaApp());

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Clima',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffd9784f),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xff192b35),
      useMaterial3: true,
    ),
    home: const LoadingScreen(),
  );
}
