import 'package:flutter_test/flutter_test.dart';
import 'package:zaix/models/comic/view_point_model.dart';

void main() {
  group('ComicViewPointModel.parseV4Response', () {
    test('parses v4 tuple list and skips blank items', () {
      final items = ComicViewPointModel.parseV4Response({
        'total': 3,
        'list': [
          [173066, 0, 4, 18, '', 0, 255344, '让你多吃蛋白质来的'],
          [173066, 0, 4, 18, '', 0, 1331968, '   '],
          [173066, 2, 4, 18, '', 0, 820629, '好看，快更新'],
        ],
      });

      expect(items.length, 2);
      expect(items[0].chapterId, 173066);
      expect(items[0].page, 0);
      expect(items[0].uid, 255344);
      expect(items[0].content, '让你多吃蛋白质来的');
      expect(items[1].page, 2);
      expect(items[1].content, '好看，快更新');
    });

    test('returns empty list when data list is null', () {
      final items = ComicViewPointModel.parseV4Response({
        'total': 0,
        'list': null,
      });

      expect(items, isEmpty);
    });

    test('serializes toJson with primitive values', () {
      final item = ComicViewPointModel.fromV4List([
        173066,
        0,
        4,
        18,
        '',
        0,
        255344,
        '大人，时代变啦',
      ]);

      expect(item.toJson(), {
        'id': 255344,
        'uid': 255344,
        'content': '大人，时代变啦',
        'num': 0,
        'page': 0,
        'chapterId': 173066,
      });
    });
  });
}
