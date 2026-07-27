import 'package:zaix/models/db/comic_download_info.dart';
import 'package:zaix/models/db/comic_history.dart';
import 'package:zaix/models/db/download_status.dart';
import 'package:zaix/models/db/local_favorite.dart';
import 'package:zaix/models/db/novel_download_info.dart';
import 'package:zaix/models/db/novel_history.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  test('Hive CE adapters retain the legacy on-disk type IDs', () {
    expect(ComicHistoryAdapter().typeId, 1);
    expect(NovelHistoryAdapter().typeId, 2);
    expect(ComicDownloadInfoAdapter().typeId, 3);
    expect(DownloadStatusAdapter().typeId, 4);
    expect(NovelDownloadInfoAdapter().typeId, 5);
    expect(LocalFavoriteAdapter().typeId, 6);
  });

  test('legacy comic downloads keep defaults for fields added later', () {
    final download = ComicDownloadInfoAdapter().read(
      _FieldReader({
        0: 'comic-1',
        1: 1,
        2: 'Comic',
        3: 'cover',
        4: 2,
        5: 'Chapter',
        6: 'Volume',
        7: 1,
        8: 'save-path',
        9: <String>[],
        10: 0,
        11: 0,
        12: DownloadStatus.wait,
        13: DateTime(2026),
        14: <String>[],
      }),
    );

    expect(download.isVip, isFalse);
    expect(download.isLongComic, isFalse);
  });
}

class _FieldReader implements BinaryReader {
  _FieldReader(Map<int, Object?> fields) : _fields = fields.entries.toList();

  final List<MapEntry<int, Object?>> _fields;
  var _fieldIndex = 0;
  var _readHeader = false;

  @override
  int readByte() {
    if (!_readHeader) {
      _readHeader = true;
      return _fields.length;
    }
    return _fields[_fieldIndex].key;
  }

  @override
  dynamic read([int? typeId]) => _fields[_fieldIndex++].value;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
