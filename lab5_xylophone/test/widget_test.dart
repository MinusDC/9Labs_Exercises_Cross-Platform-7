// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:lab5_xylophone/main.dart';

void main() {
  testWidgets('Xylophone app shows notes and can be tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Xylophone'), findsOneWidget);
    expect(find.text('NOTE 1'), findsOneWidget);
    expect(find.text('NOTE 7'), findsOneWidget);

    await tester.tap(find.text('NOTE 1'));
    await tester.pump();

    expect(find.text('NOTE 1'), findsOneWidget);
  });
}
