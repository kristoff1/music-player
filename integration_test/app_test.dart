

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/pages/home/home_page.dart';
import 'package:music_player/util/injector.dart';

import 'app_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {

    testWidgets('Test all the requirements', (WidgetTester tester) async {

      await tester.pumpWidget(InheritedInjection(isTesting: true,child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      )));

      await tester.pumpAndSettle();
      expect(find.byKey(const Key('InitialView')), findsOneWidget);
      expect(find.byKey(const Key('SearchView')), findsOneWidget);
      expect(find.byKey(const Key('MusicList')), findsNothing);
      expect(find.byKey(const Key('MusicList')), findsNothing);
      expect(find.byKey(const Key('PlayerView')), findsNothing);

      final Finder searchBar = find.byKey(const Key('SearchView'));

      await tester.tap(searchBar);

      await tester.pumpAndSettle();

      await tester.enterText(searchBar, 'John Mayer');

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('MusicList')), findsOneWidget);
      expect(find.byKey(const Key('Item1')), findsOneWidget);

      final Finder musicItem = find.byKey(const Key('Item1'));

      await tester.tap(musicItem);

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('PlayerView')), findsOneWidget);


    });
  });
}