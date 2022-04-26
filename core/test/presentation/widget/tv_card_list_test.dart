import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';
import '../app_helper.dart';

void main() {
  late TV data;

  final routes = <String, WidgetBuilder>{
    '/next': (context) => const FakeDestination(),
  };

  setUp(() {
    data = testTV;
  });

  tearDown(() {
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
  });

  testWidgets('should show card list properly when data not a watchlist',
      (tester) async {
    await tester.pumpWidget(
      testableMaterialApp(
        routes,
        FakeHome(
          body: TVCard(
            tv: data,
            onTap: () {},
          ),
        ),
      ),
    );
    expect(find.byKey(const Key('fakeHome')), findsOneWidget);
    final cardFinder = find.byType(Card);
    expect(cardFinder, findsOneWidget);
  });

  testWidgets('should show card list properly when data is a watchlist',
      (tester) async {
    await tester.pumpWidget(
      testableMaterialApp(
        routes,
        FakeHome(
          body: TVCard(
            tv: data,
            onTap: () {},
          ),
        ),
      ),
    );
    expect(find.byKey(const Key('fakeHome')), findsOneWidget);
    final cardFinder = find.byType(Card);

    expect(cardFinder, findsOneWidget);
  });
}
