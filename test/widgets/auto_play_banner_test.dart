import 'package:flutter/material.dart';
import 'package:zaix/widgets/auto_play_banner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('auto-plays pages and reports taps for the active item', (
    tester,
  ) async {
    int? tappedIndex;
    const titles = ['第一页', '第二页'];

    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SizedBox(
            width: 320,
            height: 180,
            child: AutoPlayBanner(
              itemCount: titles.length,
              autoPlayInterval: Duration(seconds: 1),
              itemBuilder: (_, index) => ColoredBox(
                key: ValueKey('banner-$index'),
                color: index == 0 ? Colors.blue : Colors.green,
              ),
              titleBuilder: (index) => titles[index],
              onTap: (index) => tappedIndex = index,
            ),
          ),
        ),
      ),
    );

    expect(find.text('第一页'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('banner-0')));
    expect(tappedIndex, 0);

    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('第二页'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('banner-1')));
    expect(tappedIndex, 1);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
