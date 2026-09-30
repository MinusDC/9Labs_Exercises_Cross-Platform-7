import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(const BmiApp());

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BMI Calculator',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff4ca68d),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xff18262c),
      useMaterial3: true,
    ),
    home: const InputPage(),
  );
}
