import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_watchlist_app/main.dart';

void main() {
  testWidgets('movie details and watchlist work', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Movie Watchlist'), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);

    await tester.tap(find.text('Inception'));
    await tester.pumpAndSettle();

    expect(find.text('Cast'), findsOneWidget);
    expect(find.text('Synopsis'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.bookmark_border));
    await tester.pump();
    expect(find.byIcon(Icons.bookmark), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('View Watchlist'));
    await tester.pumpAndSettle();

    expect(find.text('My Watchlist'), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);
  });
}
