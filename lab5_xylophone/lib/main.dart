import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Trần Văn Trừ - Xylophone',
    theme: ThemeData(useMaterial3: true),
    home: const XylophonePage(),
  );
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  static const _colors = [
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 255, 110, 6),
    Color.fromARGB(255, 238, 179, 4),
    Color.fromARGB(255, 0, 255, 30),
    Color.fromARGB(255, 11, 255, 247),
    Color.fromARGB(255, 1, 42, 92),
    Color.fromARGB(255, 152, 110, 230),
  ];
  final AudioPlayer _player = AudioPlayer();

  Future<void> playSound(int noteNumber) async {
    await _player.stop();
    await _player.play(AssetSource('sounds/note$noteNumber.wav'));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Trần Văn Trừ - Xylophone'),
      centerTitle: true,
    ),
    body: SafeArea(
      child: Column(
        children: List.generate(
          _colors.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _colors[index],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () => playSound(index + 1),
                  child: Text(
                    'NOTE ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
