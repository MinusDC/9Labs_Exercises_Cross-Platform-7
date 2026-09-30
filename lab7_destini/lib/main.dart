import 'package:flutter/material.dart';

void main() => runApp(const DestiniApp());

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Destini',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffd29363),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    ),
    home: const StoryPage(),
  );
}

class Story {
  const Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
    required this.nextStory1,
    required this.nextStory2,
  });

  final String storyTitle;
  final String choice1;
  final String choice2;
  final int nextStory1;
  final int nextStory2;
}

class StoryBrain {
  final List<Story> _stories = const [
    Story(
      storyTitle:
          'A storm has left your car stranded on a quiet forest road. A lantern glows from a narrow trail nearby.',
      choice1: 'Follow the lantern into the woods.',
      choice2: 'Stay by the car and wait for help.',
      nextStory1: 1,
      nextStory2: 2,
    ),
    Story(
      storyTitle:
          'The trail opens at a cabin. A traveler offers you a warm drink and a map out of the forest.',
      choice1: 'Accept the map and head for the village.',
      choice2: 'Thank the traveler and explore the cabin.',
      nextStory1: 3,
      nextStory2: 3,
    ),
    Story(
      storyTitle:
          'A rescue truck arrives before the rain gets heavier. The driver says the village is just over the ridge.',
      choice1: 'Ride with the driver to safety.',
      choice2: 'Walk toward the ridge together.',
      nextStory1: 3,
      nextStory2: 3,
    ),
    Story(
      storyTitle:
          'At dawn, you reach the village as the clouds part. The long night becomes a story worth telling.',
      choice1: 'Start the story again.',
      choice2: '',
      nextStory1: 0,
      nextStory2: 0,
    ),
  ];

  int _currentStory = 0;

  Story get current => _stories[_currentStory];
  bool get isFinished => current.choice2.isEmpty;

  void choose(int choice) {
    if (isFinished) {
      _currentStory = 0;
      return;
    }
    _currentStory = choice == 1 ? current.nextStory1 : current.nextStory2;
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain _storyBrain = StoryBrain();

  void _choose(int choice) => setState(() => _storyBrain.choose(choice));

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/background.png', fit: BoxFit.cover),
        ColoredBox(color: Colors.black.withValues(alpha: 0.5)),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'DESTINI',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      _storyBrain.current.storyTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(height: 1.4, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                _ChoiceButton(
                  label: _storyBrain.isFinished
                      ? 'Bắt đầu lại'
                      : _storyBrain.current.choice1,
                  color: const Color(0xff347e78),
                  onPressed: () => _choose(1),
                ),
                Visibility(
                  visible: !_storyBrain.isFinished,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _ChoiceButton(
                      label: _storyBrain.current.choice2,
                      color: const Color(0xffb05c49),
                      onPressed: () => _choose(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(18),
      ),
      onPressed: onPressed,
      child: Text(label, textAlign: TextAlign.center),
    ),
  );
}
