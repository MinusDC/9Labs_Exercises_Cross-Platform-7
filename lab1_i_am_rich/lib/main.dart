import 'package:flutter/material.dart';

void main() => runApp(const IAmRichApp());

class IAmRichApp extends StatelessWidget {
  const IAmRichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I Am Rich',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff46c4cf),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xff0d192b),
        useMaterial3: true,
      ),
      home: const RichPage(),
    );
  }
}

class RichPage extends StatelessWidget {
  const RichPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trần Văn Trừ - 23IT.B237'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/diamond1.png',
              width: 260,
              height: 260,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 28),
            Text(
              'I Am Rich',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xffe6f6f2),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
