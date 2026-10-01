import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab3_dice/main.dart';

void main() {
  testWidgets('Dice app shows dice and roll button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DiceApp());

    expect(find.text('Trần Văn Trừ Lab 3 - Dice'), findsWidgets);
    expect(find.byType(Image), findsNWidgets(2));
    expect(find.text('Roll'), findsOneWidget);

    await tester.tap(find.text('Roll'));
    await tester.pump();

    expect(find.byType(Image), findsNWidgets(2));
  });
}
