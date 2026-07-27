import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class ComicAuthorModel {
  ComicAuthorModel({
    required this.nickname,
    this.description,
    required this.cover,
    required this.data,
  });

  factory ComicAuthorModel.fromJson(Map<String, dynamic> json) {
    final List<ComicAuthorComicModel>? data =
        json['data'] is List ? <ComicAuthorComicModel>[] : null;
    if (data != null) {
      for (final dynamic item in json['data']!) {
        if (item != null) {
          data.add(
              ComicAuthorComicModel.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return ComicAuthorModel(
      nickname: asT<String>(json['nickname'])!,
      description: asT<String?>(json['description']) ?? "",
      cover: asT<String>(json['cover'])!,
      data: data!,
    );
  }

  factory ComicAuthorModel.fromSearch({
    required String authorName,
    required Iterable<Map<String, dynamic>> results,
  }) {
    final normalizedAuthorName = _normalizeAuthorName(authorName);
    final data = <ComicAuthorComicModel>[];

    for (final item in results) {
      final authors = asT<String?>(item['authors']) ?? "";
      final matches = _normalizeAuthorName(authors) == normalizedAuthorName ||
          authors
              .split(RegExp(r'[/／,，、;；&＆]'))
              .map(_normalizeAuthorName)
              .contains(normalizedAuthorName);
      if (!matches) {
        continue;
      }

      final id = asT<int?>(item['id']);
      final name = asT<String?>(item['title']);
      if (id == null || name == null) {
        continue;
      }
      data.add(
        ComicAuthorComicModel(
          id: id,
          name: name,
          cover: asT<String?>(item['cover']) ?? "",
          status: asT<String?>(item['status']) ??
              asT<String?>(item['last_name']) ??
              "",
        ),
      );
    }

    return ComicAuthorModel(
      nickname: authorName,
      description: "",
      cover: "",
      data: data,
    );
  }

  String nickname;
  String? description;
  String cover;
  List<ComicAuthorComicModel> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nickname': nickname,
        'description': description,
        'cover': cover,
        'data': data,
      };
}

String _normalizeAuthorName(String value) =>
    value.replaceAll(RegExp(r'\s+'), '').toLowerCase();

class ComicAuthorComicModel {
  ComicAuthorComicModel({
    required this.id,
    required this.name,
    required this.cover,
    required this.status,
  });

  factory ComicAuthorComicModel.fromJson(Map<String, dynamic> json) =>
      ComicAuthorComicModel(
        id: asT<int>(json['id'])!,
        name: asT<String>(json['name'])!,
        cover: asT<String>(json['cover'])!,
        status: asT<String>(json['status'])!,
      );

  int id;
  String name;
  String cover;
  String status;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'cover': cover,
        'status': status,
      };
}
