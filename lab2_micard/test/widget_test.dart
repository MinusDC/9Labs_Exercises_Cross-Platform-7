import 'package:flutter_test/flutter_test.dart';

import 'package:lab2_micard/main.dart';

void main() {
  testWidgets('MiCard app shows contact details', (WidgetTester tester) async {
    await tester.pumpWidget(const MiCardApp());

    expect(find.text('MiCard'), findsWidgets);
    expect(find.text('Trần Văn Trừ '), findsOneWidget);
    expect(find.text('FLUTTER DEVELOPER'), findsOneWidget);
    expect(find.text('23IT.B237'), findsOneWidget);
    expect(find.text('trutv.23itb@vku.udn.vn'), findsOneWidget);
  });
}
