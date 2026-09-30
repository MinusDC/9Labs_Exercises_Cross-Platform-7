import 'package:flutter_test/flutter_test.dart';
import 'package:lab1_i_am_rich/main.dart';

void main() {
  testWidgets('shows the diamond and title', (tester) async {
    await tester.pumpWidget(const IAmRichApp());

    expect(find.text('I Am Rich'), findsOneWidget);
    expect(find.byType(RichPage), findsOneWidget);
  });
}
