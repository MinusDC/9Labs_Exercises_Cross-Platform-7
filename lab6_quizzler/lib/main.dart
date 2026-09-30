import 'package:flutter/material.dart';

void main() => runApp(const QuizzlerApp());

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Quizzler',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffe1aa56),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xff213a45),
      useMaterial3: true,
    ),
    home: const QuizPage(),
  );
}

class Question {
  const Question(this.questionText, this.questionAnswer);

  final String questionText;
  final bool questionAnswer;
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> _questions = const [
    Question('A group of flamingos is called a flamboyance.', true),
    Question(
      'The Great Wall of China is visible from the Moon with the naked eye.',
      false,
    ),
    Question('Octopuses have three hearts.', true),
    Question('Lightning never strikes the same place twice.', false),
    Question('Honey can remain edible for thousands of years.', true),
  ];
  final List<Icon> scoreKeeper = [];
  int _questionIndex = 0;

  void _answer(bool answer) {
    final correct = _questions[_questionIndex].questionAnswer == answer;
    setState(() {
      scoreKeeper.add(
        Icon(
          correct ? Icons.check_circle : Icons.cancel,
          color: correct ? const Color(0xff63cb91) : const Color(0xffef7770),
          semanticLabel: correct ? 'Correct' : 'Incorrect',
        ),
      );
      _questionIndex++;
      if (_questionIndex == _questions.length) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Quiz complete. Starting again.')),
        );
        _questionIndex = 0;
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Quizzler'), centerTitle: true),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  _questions[_questionIndex].questionText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            _AnswerButton(
              label: 'Đúng',
              color: const Color(0xff328a68),
              onPressed: () => _answer(true),
            ),
            const SizedBox(height: 12),
            _AnswerButton(
              label: 'Sai',
              color: const Color(0xffbb514b),
              onPressed: () => _answer(false),
            ),
            const SizedBox(height: 18),
            Row(spacing: 6, children: scoreKeeper),
          ],
        ),
      ),
    ),
  );
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 58,
    child: FilledButton(
      style: FilledButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 18)),
    ),
  );
}
