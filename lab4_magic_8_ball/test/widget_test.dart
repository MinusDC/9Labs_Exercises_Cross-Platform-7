// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab4_magic_8_ball/main.dart';

void main() {
  testWidgets('Magic 8 Ball shows intro and responds when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Ask a question, then tap the ball.'), findsOneWidget);
    expect(find.text('Ask the ball'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    await tester.tap(find.text('Ask the ball'));
    await tester.pump();

    expect(find.text('Ask the ball'), findsOneWidget);
  });
}
