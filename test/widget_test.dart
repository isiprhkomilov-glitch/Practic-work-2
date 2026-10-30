import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:notes_app/main.dart';

void main() {
  testWidgets('Заметка добавляется, редактируется и удаляется',
      (WidgetTester tester) async {
    await tester.pumpWidget(const NotesApp());

    await tester.enterText(find.byType(TextField), 'Первая заметка');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Первая заметка'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'Обновлённая заметка');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Обновлённая заметка'), findsOneWidget);
    expect(find.text('Первая заметка'), findsNothing);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.text('Обновлённая заметка'), findsNothing);
  });
}
