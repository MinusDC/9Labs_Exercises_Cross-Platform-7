import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Magic 8 Ball',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffd4a84e),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xff17212e),
      useMaterial3: true,
    ),
    home: const MagicBallPage(),
  );
}

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  static const _answers = [
    'Yes',
    'No',
    'Ask again later',
    'Definitely',
    'Not likely',
  ];
  final Random _random = Random();
  String? _answer;

  void _ask() =>
      setState(() => _answer = _answers[_random.nextInt(_answers.length)]);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Magic 8 Ball'), centerTitle: true),
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ask a question, then tap the ball.'),
              const SizedBox(height: 24),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/ball1.png',
                    width: 300,
                    height: 300,
                  ),
                  if (_answer != null)
                    SizedBox(
                      width: 150,
                      child: Text(
                        _answer!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xff17212e),
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              FilledButton(onPressed: _ask, child: const Text('Ask the ball')),
            ],
          ),
        ),
      ),
    ),
  );
}
