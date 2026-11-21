import 'dart:convert';

import 'package:get/get.dart';

int _parseInt(dynamic value, {int fallback = 0}) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  return int.tryParse(value?.toString() ?? '') ?? fallback;
}

class ComicViewPointModel {
  ComicViewPointModel({
    required this.id,
    required this.uid,
    required this.content,
    required this.num,
    required this.page,
    this.chapterId = 0,
  });

  factory ComicViewPointModel.fromJson(Map<String, dynamic> json) =>
      ComicViewPointModel(
        id: _parseInt(json['id']),
        uid: _parseInt(json['uid']),
        content: (json['content']?.toString() ?? '').trim(),
        num: _parseInt(json['num']).obs,
        page: _parseInt(json['page']),
        chapterId: _parseInt(json['chapterId'] ?? json['chapter_id']),
      );

  factory ComicViewPointModel.fromV4List(List<dynamic> row) {
    final chapterId = row.isNotEmpty ? _parseInt(row[0]) : 0;
    final page = row.length > 1 ? _parseInt(row[1]) : 0;
    final uid = row.length > 6 ? _parseInt(row[6]) : 0;
    final rawContent = row.length > 7 ? row[7] : null;
    final content = (rawContent?.toString() ?? '').trim();
    return ComicViewPointModel(
      id: uid,
      uid: uid,
      content: content,
      num: 0.obs,
      page: page,
      chapterId: chapterId,
    );
  }

  static List<ComicViewPointModel> parseV4Response(dynamic data) {
    dynamic rawList = data;
    if (data is Map) {
      rawList = data['list'];
    }
    if (rawList is! List) {
      return <ComicViewPointModel>[];
    }
    final result = <ComicViewPointModel>[];
    for (final item in rawList) {
      ComicViewPointModel? model;
      if (item is List) {
        model = ComicViewPointModel.fromV4List(item);
      } else if (item is Map) {
        final map = Map<String, dynamic>.from(item);
        model = ComicViewPointModel.fromJson(map);
      }
      if (model != null && model.content.isNotEmpty) {
        result.add(model);
      }
    }
    return result;
  }

  int id;
  int uid;
  String content;
  RxInt num;
  int page;
  int chapterId;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'uid': uid,
    'content': content,
    'num': num.value,
    'page': page,
    'chapterId': chapterId,
  };
}
