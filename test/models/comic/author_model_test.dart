import 'package:zaix/models/comic/author_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ComicAuthorModel.fromSearch', () {
    test('keeps only exact author matches', () {
      final model = ComicAuthorModel.fromSearch(
        authorName: 'むちまろ',
        results: [
          {
            'id': 64755,
            'title': '脑洞学生会',
            'authors': 'むちまろ',
            'cover': 'cover-1',
            'status': '连载中',
          },
          {
            'id': 79652,
            'title': '官方插画集',
            'authors': '编辑部 / むちまろ',
            'cover': 'cover-2',
            'status': '连载中',
          },
          {
            'id': 76856,
            'title': '模糊搜索结果',
            'authors': 'Chilly polka（すいみゃ）',
            'cover': 'cover-3',
            'status': '短篇',
          },
        ],
      );

      expect(model.nickname, 'むちまろ');
      expect(model.data.map((item) => item.id), [64755, 79652]);
    });

    test('returns an explicit empty author model when there are no works', () {
      final model = ComicAuthorModel.fromSearch(
        authorName: '没有作品的作者',
        results: const [],
      );

      expect(model.nickname, '没有作品的作者');
      expect(model.data, isEmpty);
      expect(model.cover, isEmpty);
    });
  });
}
