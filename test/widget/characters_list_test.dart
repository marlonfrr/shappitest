// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shappitest/core/characters/provider.dart';
import 'package:shappitest/ui/views/character_list.dart';
import 'package:shappitest/ui/widgets/character_tile.dart';

import '../mock_data/characters.dart';
import '../mock_services/fake_service.dart';

void main() {
  group('Charcaters list view set up', () {
    Future<void> widgetPump(
        WidgetTester tester, List<Map<String, dynamic>> mockCharacters) async {
      Widget test = ProviderScope(
        overrides: [
          serviceProvider.overrideWithProvider(
              Provider((_) => FakeRyMServices(mockCharacters: mockCharacters)))
        ],
        child: const MaterialApp(
          home: CharactersListView(),
        ),
      );

      await tester.pumpWidget(test);
      await tester.pumpAndSettle();
    }

    testWidgets('Set up with no characters on screen',
        (WidgetTester tester) async {
      List<Map<String, dynamic>> mockCharacters = [];
      await widgetPump(tester, mockCharacters);

      expect(find.byType(CharacterTile), findsNothing);
    });

    testWidgets('Set up with 1 characters on screen',
        (WidgetTester tester) async {
      List<Map<String, dynamic>> mockCharacters = [char1];
      await widgetPump(tester, mockCharacters);

      expect(find.byType(CharacterTile), findsOneWidget);
    });

    testWidgets('Set up with 4 characters on screen, checks',
        (WidgetTester tester) async {
      List<Map<String, dynamic>> mockCharacters = [char5, char6, char7, char8];
      await widgetPump(tester, mockCharacters);

      expect(find.byType(CharacterTile), findsNWidgets(4));
      expect(find.text('Octopus Man'), findsOneWidget);
      expect(find.text('Orthodox Jew'), findsOneWidget);
      expect(find.text('Pat Gueterman'), findsOneWidget);
      expect(find.text('Paul Fleishman'), findsOneWidget);

      expect(find.byType(CachedNetworkImage), findsNWidgets(4));
      expect(find.byType(Icon), findsNWidgets(5)); // 4 right arrows + 1 trash
    });

    testWidgets(
        'Set up with 1 character on screen, taps one to push detail view',
        (WidgetTester tester) async {
      List<Map<String, dynamic>> mockCharacters = [char9];
      await widgetPump(tester, mockCharacters);

      await tester.tap(find.byType(CharacterTile).at(0));

      await tester.pumpAndSettle();

      expect(find.text('Status'),
          findsOneWidget); // Checks if already on next page
    });

    testWidgets(
        'Set up with 4 characters on screen, taps one to push detail view',
        (WidgetTester tester) async {
      List<Map<String, dynamic>> mockCharacters = [char2];
      await widgetPump(tester, mockCharacters);

      expect(find.text('Gender'), findsOneWidget);

      expect(find.byIcon(Icons.delete_forever), findsNothing);

      await tester.tap(find.text('Gender').at(0), warnIfMissed: false);

      await tester.pumpAndSettle();

      await tester.tap(find.text('Male').at(0), warnIfMissed: false);

      await tester.pumpAndSettle();

      expect(find.text('Gender'), findsOneWidget);

      expect(find.byIcon(Icons.delete_forever), findsOneWidget);
      // debugDumpApp();
    });
  });
}
