// This is a generated file - do not edit.
//
// Generated from novel.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class NovelChapterDetailProto extends $pb.GeneratedMessage {
  factory NovelChapterDetailProto({
    $fixnum.Int64? chapterId,
    $core.String? chapterName,
    $core.int? chapterOrder,
  }) {
    final result = create();
    if (chapterId != null) result.chapterId = chapterId;
    if (chapterName != null) result.chapterName = chapterName;
    if (chapterOrder != null) result.chapterOrder = chapterOrder;
    return result;
  }

  NovelChapterDetailProto._();

  factory NovelChapterDetailProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NovelChapterDetailProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NovelChapterDetailProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'chapterId', protoName: 'chapterId')
    ..aOS(2, _omitFieldNames ? '' : 'chapterName', protoName: 'chapterName')
    ..aI(3, _omitFieldNames ? '' : 'chapterOrder', protoName: 'chapterOrder')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelChapterDetailProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelChapterDetailProto copyWith(
          void Function(NovelChapterDetailProto) updates) =>
      super.copyWith((message) => updates(message as NovelChapterDetailProto))
          as NovelChapterDetailProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NovelChapterDetailProto create() => NovelChapterDetailProto._();
  @$core.override
  NovelChapterDetailProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NovelChapterDetailProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NovelChapterDetailProto>(create);
  static NovelChapterDetailProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chapterId => $_getI64(0);
  @$pb.TagNumber(1)
  set chapterId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChapterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChapterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chapterName => $_getSZ(1);
  @$pb.TagNumber(2)
  set chapterName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChapterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearChapterName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get chapterOrder => $_getIZ(2);
  @$pb.TagNumber(3)
  set chapterOrder($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChapterOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearChapterOrder() => $_clearField(3);
}

class NovelVolumeProto extends $pb.GeneratedMessage {
  factory NovelVolumeProto({
    $fixnum.Int64? volumeId,
    $fixnum.Int64? lnovelId,
    $core.String? volumeName,
    $core.int? volumeOrder,
    $fixnum.Int64? addtime,
    $core.int? sumChapters,
  }) {
    final result = create();
    if (volumeId != null) result.volumeId = volumeId;
    if (lnovelId != null) result.lnovelId = lnovelId;
    if (volumeName != null) result.volumeName = volumeName;
    if (volumeOrder != null) result.volumeOrder = volumeOrder;
    if (addtime != null) result.addtime = addtime;
    if (sumChapters != null) result.sumChapters = sumChapters;
    return result;
  }

  NovelVolumeProto._();

  factory NovelVolumeProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NovelVolumeProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NovelVolumeProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'volumeId')
    ..aInt64(2, _omitFieldNames ? '' : 'lnovelId')
    ..aOS(3, _omitFieldNames ? '' : 'volumeName')
    ..aI(4, _omitFieldNames ? '' : 'volumeOrder')
    ..aInt64(5, _omitFieldNames ? '' : 'addtime')
    ..aI(6, _omitFieldNames ? '' : 'sumChapters')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelVolumeProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelVolumeProto copyWith(void Function(NovelVolumeProto) updates) =>
      super.copyWith((message) => updates(message as NovelVolumeProto))
          as NovelVolumeProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NovelVolumeProto create() => NovelVolumeProto._();
  @$core.override
  NovelVolumeProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NovelVolumeProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NovelVolumeProto>(create);
  static NovelVolumeProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get volumeId => $_getI64(0);
  @$pb.TagNumber(1)
  set volumeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVolumeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVolumeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lnovelId => $_getI64(1);
  @$pb.TagNumber(2)
  set lnovelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLnovelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLnovelId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get volumeName => $_getSZ(2);
  @$pb.TagNumber(3)
  set volumeName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVolumeName() => $_has(2);
  @$pb.TagNumber(3)
  void clearVolumeName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get volumeOrder => $_getIZ(3);
  @$pb.TagNumber(4)
  set volumeOrder($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVolumeOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearVolumeOrder() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get addtime => $_getI64(4);
  @$pb.TagNumber(5)
  set addtime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAddtime() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddtime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get sumChapters => $_getIZ(5);
  @$pb.TagNumber(6)
  set sumChapters($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSumChapters() => $_has(5);
  @$pb.TagNumber(6)
  void clearSumChapters() => $_clearField(6);
}

class NovelChapterResponseProto extends $pb.GeneratedMessage {
  factory NovelChapterResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    $core.Iterable<NovelVolumeDetailProto>? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data.addAll(data);
    return result;
  }

  NovelChapterResponseProto._();

  factory NovelChapterResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NovelChapterResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NovelChapterResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..pPM<NovelVolumeDetailProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: NovelVolumeDetailProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelChapterResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelChapterResponseProto copyWith(
          void Function(NovelChapterResponseProto) updates) =>
      super.copyWith((message) => updates(message as NovelChapterResponseProto))
          as NovelChapterResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NovelChapterResponseProto create() => NovelChapterResponseProto._();
  @$core.override
  NovelChapterResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NovelChapterResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NovelChapterResponseProto>(create);
  static NovelChapterResponseProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errno => $_getIZ(0);
  @$pb.TagNumber(1)
  set errno($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasErrno() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrno() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errmsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errmsg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrmsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrmsg() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<NovelVolumeDetailProto> get data => $_getList(2);
}

class NovelVolumeDetailProto extends $pb.GeneratedMessage {
  factory NovelVolumeDetailProto({
    $fixnum.Int64? volumeId,
    $core.String? volumeName,
    $core.int? volumeOrder,
    $core.Iterable<NovelChapterDetailProto>? chapters,
  }) {
    final result = create();
    if (volumeId != null) result.volumeId = volumeId;
    if (volumeName != null) result.volumeName = volumeName;
    if (volumeOrder != null) result.volumeOrder = volumeOrder;
    if (chapters != null) result.chapters.addAll(chapters);
    return result;
  }

  NovelVolumeDetailProto._();

  factory NovelVolumeDetailProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NovelVolumeDetailProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NovelVolumeDetailProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'volumeId')
    ..aOS(2, _omitFieldNames ? '' : 'volumeName')
    ..aI(3, _omitFieldNames ? '' : 'volumeOrder')
    ..pPM<NovelChapterDetailProto>(4, _omitFieldNames ? '' : 'chapters',
        subBuilder: NovelChapterDetailProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelVolumeDetailProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelVolumeDetailProto copyWith(
          void Function(NovelVolumeDetailProto) updates) =>
      super.copyWith((message) => updates(message as NovelVolumeDetailProto))
          as NovelVolumeDetailProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NovelVolumeDetailProto create() => NovelVolumeDetailProto._();
  @$core.override
  NovelVolumeDetailProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NovelVolumeDetailProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NovelVolumeDetailProto>(create);
  static NovelVolumeDetailProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get volumeId => $_getI64(0);
  @$pb.TagNumber(1)
  set volumeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVolumeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVolumeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get volumeName => $_getSZ(1);
  @$pb.TagNumber(2)
  set volumeName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVolumeName() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolumeName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get volumeOrder => $_getIZ(2);
  @$pb.TagNumber(3)
  set volumeOrder($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVolumeOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearVolumeOrder() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<NovelChapterDetailProto> get chapters => $_getList(3);
}

class NovelDetailProto extends $pb.GeneratedMessage {
  factory NovelDetailProto({
    $fixnum.Int64? novelId,
    $core.String? name,
    $core.String? zone,
    $core.String? status,
    $core.String? lastUpdateVolumeName,
    $core.String? lastUpdateChapterName,
    $fixnum.Int64? lastUpdateVolumeId,
    $fixnum.Int64? lastUpdateChapterId,
    $fixnum.Int64? lastUpdateTime,
    $core.String? cover,
    $fixnum.Int64? hotHits,
    $core.String? introduction,
    $core.Iterable<$core.String>? types,
    $core.String? authors,
    $core.String? firstLetter,
    $fixnum.Int64? subscribeNum,
    $fixnum.Int64? redisUpdateTime,
    $core.Iterable<NovelVolumeProto>? volume,
  }) {
    final result = create();
    if (novelId != null) result.novelId = novelId;
    if (name != null) result.name = name;
    if (zone != null) result.zone = zone;
    if (status != null) result.status = status;
    if (lastUpdateVolumeName != null)
      result.lastUpdateVolumeName = lastUpdateVolumeName;
    if (lastUpdateChapterName != null)
      result.lastUpdateChapterName = lastUpdateChapterName;
    if (lastUpdateVolumeId != null)
      result.lastUpdateVolumeId = lastUpdateVolumeId;
    if (lastUpdateChapterId != null)
      result.lastUpdateChapterId = lastUpdateChapterId;
    if (lastUpdateTime != null) result.lastUpdateTime = lastUpdateTime;
    if (cover != null) result.cover = cover;
    if (hotHits != null) result.hotHits = hotHits;
    if (introduction != null) result.introduction = introduction;
    if (types != null) result.types.addAll(types);
    if (authors != null) result.authors = authors;
    if (firstLetter != null) result.firstLetter = firstLetter;
    if (subscribeNum != null) result.subscribeNum = subscribeNum;
    if (redisUpdateTime != null) result.redisUpdateTime = redisUpdateTime;
    if (volume != null) result.volume.addAll(volume);
    return result;
  }

  NovelDetailProto._();

  factory NovelDetailProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NovelDetailProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NovelDetailProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'novelId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'zone')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'lastUpdateVolumeName')
    ..aOS(6, _omitFieldNames ? '' : 'lastUpdateChapterName')
    ..aInt64(7, _omitFieldNames ? '' : 'lastUpdateVolumeId')
    ..aInt64(8, _omitFieldNames ? '' : 'lastUpdateChapterId')
    ..aInt64(9, _omitFieldNames ? '' : 'lastUpdateTime')
    ..aOS(10, _omitFieldNames ? '' : 'cover')
    ..aInt64(11, _omitFieldNames ? '' : 'hotHits')
    ..aOS(12, _omitFieldNames ? '' : 'introduction')
    ..pPS(13, _omitFieldNames ? '' : 'types')
    ..aOS(14, _omitFieldNames ? '' : 'authors')
    ..aOS(15, _omitFieldNames ? '' : 'firstLetter')
    ..aInt64(16, _omitFieldNames ? '' : 'subscribeNum')
    ..aInt64(17, _omitFieldNames ? '' : 'redisUpdateTime')
    ..pPM<NovelVolumeProto>(18, _omitFieldNames ? '' : 'volume',
        subBuilder: NovelVolumeProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelDetailProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelDetailProto copyWith(void Function(NovelDetailProto) updates) =>
      super.copyWith((message) => updates(message as NovelDetailProto))
          as NovelDetailProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NovelDetailProto create() => NovelDetailProto._();
  @$core.override
  NovelDetailProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NovelDetailProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NovelDetailProto>(create);
  static NovelDetailProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get novelId => $_getI64(0);
  @$pb.TagNumber(1)
  set novelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNovelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNovelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get zone => $_getSZ(2);
  @$pb.TagNumber(3)
  set zone($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasZone() => $_has(2);
  @$pb.TagNumber(3)
  void clearZone() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastUpdateVolumeName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastUpdateVolumeName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLastUpdateVolumeName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastUpdateVolumeName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get lastUpdateChapterName => $_getSZ(5);
  @$pb.TagNumber(6)
  set lastUpdateChapterName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLastUpdateChapterName() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdateChapterName() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastUpdateVolumeId => $_getI64(6);
  @$pb.TagNumber(7)
  set lastUpdateVolumeId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastUpdateVolumeId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdateVolumeId() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastUpdateChapterId => $_getI64(7);
  @$pb.TagNumber(8)
  set lastUpdateChapterId($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastUpdateChapterId() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastUpdateChapterId() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get lastUpdateTime => $_getI64(8);
  @$pb.TagNumber(9)
  set lastUpdateTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateTime() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get cover => $_getSZ(9);
  @$pb.TagNumber(10)
  set cover($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCover() => $_has(9);
  @$pb.TagNumber(10)
  void clearCover() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get hotHits => $_getI64(10);
  @$pb.TagNumber(11)
  set hotHits($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasHotHits() => $_has(10);
  @$pb.TagNumber(11)
  void clearHotHits() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get introduction => $_getSZ(11);
  @$pb.TagNumber(12)
  set introduction($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIntroduction() => $_has(11);
  @$pb.TagNumber(12)
  void clearIntroduction() => $_clearField(12);

  @$pb.TagNumber(13)
  $pb.PbList<$core.String> get types => $_getList(12);

  @$pb.TagNumber(14)
  $core.String get authors => $_getSZ(13);
  @$pb.TagNumber(14)
  set authors($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasAuthors() => $_has(13);
  @$pb.TagNumber(14)
  void clearAuthors() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get firstLetter => $_getSZ(14);
  @$pb.TagNumber(15)
  set firstLetter($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasFirstLetter() => $_has(14);
  @$pb.TagNumber(15)
  void clearFirstLetter() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get subscribeNum => $_getI64(15);
  @$pb.TagNumber(16)
  set subscribeNum($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasSubscribeNum() => $_has(15);
  @$pb.TagNumber(16)
  void clearSubscribeNum() => $_clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get redisUpdateTime => $_getI64(16);
  @$pb.TagNumber(17)
  set redisUpdateTime($fixnum.Int64 value) => $_setInt64(16, value);
  @$pb.TagNumber(17)
  $core.bool hasRedisUpdateTime() => $_has(16);
  @$pb.TagNumber(17)
  void clearRedisUpdateTime() => $_clearField(17);

  @$pb.TagNumber(18)
  $pb.PbList<NovelVolumeProto> get volume => $_getList(17);
}

class NovelDetailResponseProto extends $pb.GeneratedMessage {
  factory NovelDetailResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    NovelDetailProto? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data = data;
    return result;
  }

  NovelDetailResponseProto._();

  factory NovelDetailResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NovelDetailResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NovelDetailResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..aOM<NovelDetailProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: NovelDetailProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelDetailResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NovelDetailResponseProto copyWith(
          void Function(NovelDetailResponseProto) updates) =>
      super.copyWith((message) => updates(message as NovelDetailResponseProto))
          as NovelDetailResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NovelDetailResponseProto create() => NovelDetailResponseProto._();
  @$core.override
  NovelDetailResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NovelDetailResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NovelDetailResponseProto>(create);
  static NovelDetailResponseProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errno => $_getIZ(0);
  @$pb.TagNumber(1)
  set errno($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasErrno() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrno() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errmsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errmsg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrmsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrmsg() => $_clearField(2);

  @$pb.TagNumber(3)
  NovelDetailProto get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(NovelDetailProto value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  NovelDetailProto ensureData() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
