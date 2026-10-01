import 'package:flutter/material.dart';

void main() => runApp(const MiCardApp());

class MiCardApp extends StatelessWidget {
  const MiCardApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MiCard',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff28766a),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xff17332e),
      useMaterial3: true,
    ),
    home: const ContactCardPage(),
  );
}

class ContactCardPage extends StatelessWidget {
  const ContactCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiCard'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/tranvantru.png',
                  width: 152,
                  height: 152,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Trần Văn Trừ ',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffe6f1e8),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  letterSpacing: 2,
                  color: Color(0xffa9c9bb),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 28),
              const _ContactTile(icon: Icons.phone_outlined, text: '23IT.B237'),
              const SizedBox(height: 12),
              const _ContactTile(
                icon: Icons.email_outlined,
                text: 'trutv.23itb@vku.udn.vn',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Card(
    color: const Color(0xffe6f1e8),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xff28766a)),
      title: Text(
        text,
        style: const TextStyle(
          color: Color(0xff17332e),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
