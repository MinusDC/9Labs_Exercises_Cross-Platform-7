import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Xylophone',
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
    Color(0xffef5b5b),
    Color(0xfff18b43),
    Color(0xfff2cb5a),
    Color(0xff6cbf75),
    Color(0xff48a9a6),
    Color(0xff4d83c4),
    Color(0xff8d74bb),
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
    appBar: AppBar(title: const Text('Xylophone'), centerTitle: true),
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
