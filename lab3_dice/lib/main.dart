import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Trần Văn Trừ Lab 3 - Dice',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffef8354),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xff202b35),
      useMaterial3: true,
    ),
    home: const DicePage(),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final Random _random = Random();
  int _leftDie = 1;
  int _rightDie = 6;

  void _rollDice() {
    setState(() {
      _leftDie = _random.nextInt(6) + 1;
      _rightDie = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Trần Văn Trừ Lab 3 - Dice'),
      centerTitle: true,
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: _DieFace(value: _leftDie, onTap: _rollDice),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _DieFace(value: _rightDie, onTap: _rollDice),
                ),
              ],
            ),
            const SizedBox(height: 40),
            FilledButton.icon(
              onPressed: _rollDice,
              icon: const Icon(Icons.casino_outlined),
              label: const Text('Roll'),
            ),
          ],
        ),
      ),
    ),
  );
}

class _DieFace extends StatelessWidget {
  const _DieFace({required this.value, required this.onTap});

  final int value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(24),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(26),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          'assets/images/dice$value.png',
          fit: BoxFit.cover,
          semanticLabel: 'Die showing $value',
        ),
      ),
    ),
  );
}
