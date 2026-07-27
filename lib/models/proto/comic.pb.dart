// This is a generated file - do not edit.
//
// Generated from comic.proto.

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

class ComicChapterDetailProto extends $pb.GeneratedMessage {
  factory ComicChapterDetailProto({
    $fixnum.Int64? chapterId,
    $fixnum.Int64? comicId,
    $core.String? title,
    $core.int? chapterOrder,
    $core.int? direction,
    $core.Iterable<$core.String>? pageUrl,
    $core.int? picnum,
    $core.Iterable<$core.String>? pageUrlHD,
    $core.int? commentCount,
  }) {
    final result = create();
    if (chapterId != null) result.chapterId = chapterId;
    if (comicId != null) result.comicId = comicId;
    if (title != null) result.title = title;
    if (chapterOrder != null) result.chapterOrder = chapterOrder;
    if (direction != null) result.direction = direction;
    if (pageUrl != null) result.pageUrl.addAll(pageUrl);
    if (picnum != null) result.picnum = picnum;
    if (pageUrlHD != null) result.pageUrlHD.addAll(pageUrlHD);
    if (commentCount != null) result.commentCount = commentCount;
    return result;
  }

  ComicChapterDetailProto._();

  factory ComicChapterDetailProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicChapterDetailProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicChapterDetailProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'chapterId', protoName: 'chapterId')
    ..aInt64(2, _omitFieldNames ? '' : 'comicId', protoName: 'comicId')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aI(4, _omitFieldNames ? '' : 'chapterOrder', protoName: 'chapterOrder')
    ..aI(5, _omitFieldNames ? '' : 'direction')
    ..pPS(6, _omitFieldNames ? '' : 'pageUrl', protoName: 'pageUrl')
    ..aI(7, _omitFieldNames ? '' : 'picnum')
    ..pPS(8, _omitFieldNames ? '' : 'pageUrlHD', protoName: 'pageUrlHD')
    ..aI(9, _omitFieldNames ? '' : 'commentCount', protoName: 'commentCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterDetailProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterDetailProto copyWith(
          void Function(ComicChapterDetailProto) updates) =>
      super.copyWith((message) => updates(message as ComicChapterDetailProto))
          as ComicChapterDetailProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicChapterDetailProto create() => ComicChapterDetailProto._();
  @$core.override
  ComicChapterDetailProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicChapterDetailProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicChapterDetailProto>(create);
  static ComicChapterDetailProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chapterId => $_getI64(0);
  @$pb.TagNumber(1)
  set chapterId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChapterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChapterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get comicId => $_getI64(1);
  @$pb.TagNumber(2)
  set comicId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasComicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearComicId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get chapterOrder => $_getIZ(3);
  @$pb.TagNumber(4)
  set chapterOrder($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChapterOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearChapterOrder() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get direction => $_getIZ(4);
  @$pb.TagNumber(5)
  set direction($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirection() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get pageUrl => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get picnum => $_getIZ(6);
  @$pb.TagNumber(7)
  set picnum($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPicnum() => $_has(6);
  @$pb.TagNumber(7)
  void clearPicnum() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get pageUrlHD => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get commentCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set commentCount($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCommentCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearCommentCount() => $_clearField(9);
}

class ComicChapterInfoProto extends $pb.GeneratedMessage {
  factory ComicChapterInfoProto({
    $fixnum.Int64? chapterId,
    $core.String? chapterTitle,
    $fixnum.Int64? updateTime,
    $core.int? fileSize,
    $core.int? chapterOrder,
    $core.int? isFee,
  }) {
    final result = create();
    if (chapterId != null) result.chapterId = chapterId;
    if (chapterTitle != null) result.chapterTitle = chapterTitle;
    if (updateTime != null) result.updateTime = updateTime;
    if (fileSize != null) result.fileSize = fileSize;
    if (chapterOrder != null) result.chapterOrder = chapterOrder;
    if (isFee != null) result.isFee = isFee;
    return result;
  }

  ComicChapterInfoProto._();

  factory ComicChapterInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicChapterInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicChapterInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'chapterId', protoName: 'chapterId')
    ..aOS(2, _omitFieldNames ? '' : 'chapterTitle', protoName: 'chapterTitle')
    ..aInt64(3, _omitFieldNames ? '' : 'updateTime', protoName: 'updateTime')
    ..aI(4, _omitFieldNames ? '' : 'fileSize', protoName: 'fileSize')
    ..aI(5, _omitFieldNames ? '' : 'chapterOrder', protoName: 'chapterOrder')
    ..aI(6, _omitFieldNames ? '' : 'isFee', protoName: 'isFee')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterInfoProto copyWith(
          void Function(ComicChapterInfoProto) updates) =>
      super.copyWith((message) => updates(message as ComicChapterInfoProto))
          as ComicChapterInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicChapterInfoProto create() => ComicChapterInfoProto._();
  @$core.override
  ComicChapterInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicChapterInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicChapterInfoProto>(create);
  static ComicChapterInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chapterId => $_getI64(0);
  @$pb.TagNumber(1)
  set chapterId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChapterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChapterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chapterTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set chapterTitle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChapterTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearChapterTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get updateTime => $_getI64(2);
  @$pb.TagNumber(3)
  set updateTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get fileSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set fileSize($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFileSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get chapterOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set chapterOrder($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChapterOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearChapterOrder() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get isFee => $_getIZ(5);
  @$pb.TagNumber(6)
  set isFee($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFee() => $_clearField(6);
}

class ComicChapterResponseProto extends $pb.GeneratedMessage {
  factory ComicChapterResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    ComicChapterDetailProto? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data = data;
    return result;
  }

  ComicChapterResponseProto._();

  factory ComicChapterResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicChapterResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicChapterResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..aOM<ComicChapterDetailProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: ComicChapterDetailProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterResponseProto copyWith(
          void Function(ComicChapterResponseProto) updates) =>
      super.copyWith((message) => updates(message as ComicChapterResponseProto))
          as ComicChapterResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicChapterResponseProto create() => ComicChapterResponseProto._();
  @$core.override
  ComicChapterResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicChapterResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicChapterResponseProto>(create);
  static ComicChapterResponseProto? _defaultInstance;

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
  ComicChapterDetailProto get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ComicChapterDetailProto value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  ComicChapterDetailProto ensureData() => $_ensure(2);
}

class ComicChapterListProto extends $pb.GeneratedMessage {
  factory ComicChapterListProto({
    $core.String? title,
    $core.Iterable<ComicChapterInfoProto>? data,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (data != null) result.data.addAll(data);
    return result;
  }

  ComicChapterListProto._();

  factory ComicChapterListProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicChapterListProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicChapterListProto',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..pPM<ComicChapterInfoProto>(2, _omitFieldNames ? '' : 'data',
        subBuilder: ComicChapterInfoProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterListProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicChapterListProto copyWith(
          void Function(ComicChapterListProto) updates) =>
      super.copyWith((message) => updates(message as ComicChapterListProto))
          as ComicChapterListProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicChapterListProto create() => ComicChapterListProto._();
  @$core.override
  ComicChapterListProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicChapterListProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicChapterListProto>(create);
  static ComicChapterListProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ComicChapterInfoProto> get data => $_getList(1);
}

class ComicDetailResponseProto extends $pb.GeneratedMessage {
  factory ComicDetailResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    ComicDetailProto? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data = data;
    return result;
  }

  ComicDetailResponseProto._();

  factory ComicDetailResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicDetailResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicDetailResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..aOM<ComicDetailProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: ComicDetailProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailResponseProto copyWith(
          void Function(ComicDetailResponseProto) updates) =>
      super.copyWith((message) => updates(message as ComicDetailResponseProto))
          as ComicDetailResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDetailResponseProto create() => ComicDetailResponseProto._();
  @$core.override
  ComicDetailResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicDetailResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicDetailResponseProto>(create);
  static ComicDetailResponseProto? _defaultInstance;

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
  ComicDetailProto get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ComicDetailProto value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  ComicDetailProto ensureData() => $_ensure(2);
}

class ComicDetailProto extends $pb.GeneratedMessage {
  factory ComicDetailProto({
    $fixnum.Int64? id,
    $core.String? title,
    $core.int? direction,
    $core.int? islong,
    $core.int? isDmzj,
    $core.String? cover,
    $core.String? description,
    $fixnum.Int64? lastUpdatetime,
    $core.String? lastUpdateChapterName,
    $core.int? copyright,
    $core.String? firstLetter,
    $core.String? comicPy,
    $core.int? hidden,
    $fixnum.Int64? hotNum,
    $fixnum.Int64? hitNum,
    $fixnum.Int64? uid,
    $core.int? isLock,
    $core.int? lastUpdateChapterId,
    $core.Iterable<ComicTagProto>? types,
    $core.Iterable<ComicTagProto>? status,
    $core.Iterable<ComicTagProto>? authors,
    $fixnum.Int64? subscribeNum,
    $core.Iterable<ComicChapterListProto>? chapters,
    $core.int? isNeedLogin,
    $core.Iterable<ComicDetailUrlLinkProto>? urlLinks,
    $core.int? isHideChapter,
    $core.Iterable<ComicDetailUrlLinkProto>? dhUrlLinks,
    $core.String? cornerMark,
    $core.int? isFee,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (direction != null) result.direction = direction;
    if (islong != null) result.islong = islong;
    if (isDmzj != null) result.isDmzj = isDmzj;
    if (cover != null) result.cover = cover;
    if (description != null) result.description = description;
    if (lastUpdatetime != null) result.lastUpdatetime = lastUpdatetime;
    if (lastUpdateChapterName != null)
      result.lastUpdateChapterName = lastUpdateChapterName;
    if (copyright != null) result.copyright = copyright;
    if (firstLetter != null) result.firstLetter = firstLetter;
    if (comicPy != null) result.comicPy = comicPy;
    if (hidden != null) result.hidden = hidden;
    if (hotNum != null) result.hotNum = hotNum;
    if (hitNum != null) result.hitNum = hitNum;
    if (uid != null) result.uid = uid;
    if (isLock != null) result.isLock = isLock;
    if (lastUpdateChapterId != null)
      result.lastUpdateChapterId = lastUpdateChapterId;
    if (types != null) result.types.addAll(types);
    if (status != null) result.status.addAll(status);
    if (authors != null) result.authors.addAll(authors);
    if (subscribeNum != null) result.subscribeNum = subscribeNum;
    if (chapters != null) result.chapters.addAll(chapters);
    if (isNeedLogin != null) result.isNeedLogin = isNeedLogin;
    if (urlLinks != null) result.urlLinks.addAll(urlLinks);
    if (isHideChapter != null) result.isHideChapter = isHideChapter;
    if (dhUrlLinks != null) result.dhUrlLinks.addAll(dhUrlLinks);
    if (cornerMark != null) result.cornerMark = cornerMark;
    if (isFee != null) result.isFee = isFee;
    return result;
  }

  ComicDetailProto._();

  factory ComicDetailProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicDetailProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicDetailProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aI(3, _omitFieldNames ? '' : 'direction')
    ..aI(4, _omitFieldNames ? '' : 'islong')
    ..aI(5, _omitFieldNames ? '' : 'isDmzj', protoName: 'isDmzj')
    ..aOS(6, _omitFieldNames ? '' : 'cover')
    ..aOS(7, _omitFieldNames ? '' : 'description')
    ..aInt64(8, _omitFieldNames ? '' : 'lastUpdatetime',
        protoName: 'lastUpdatetime')
    ..aOS(9, _omitFieldNames ? '' : 'lastUpdateChapterName',
        protoName: 'lastUpdateChapterName')
    ..aI(10, _omitFieldNames ? '' : 'copyright')
    ..aOS(11, _omitFieldNames ? '' : 'firstLetter', protoName: 'firstLetter')
    ..aOS(12, _omitFieldNames ? '' : 'comicPy', protoName: 'comicPy')
    ..aI(13, _omitFieldNames ? '' : 'hidden')
    ..aInt64(14, _omitFieldNames ? '' : 'hotNum', protoName: 'hotNum')
    ..aInt64(15, _omitFieldNames ? '' : 'hitNum', protoName: 'hitNum')
    ..aInt64(16, _omitFieldNames ? '' : 'uid')
    ..aI(17, _omitFieldNames ? '' : 'isLock', protoName: 'isLock')
    ..aI(18, _omitFieldNames ? '' : 'lastUpdateChapterId',
        protoName: 'lastUpdateChapterId')
    ..pPM<ComicTagProto>(19, _omitFieldNames ? '' : 'types',
        subBuilder: ComicTagProto.create)
    ..pPM<ComicTagProto>(20, _omitFieldNames ? '' : 'status',
        subBuilder: ComicTagProto.create)
    ..pPM<ComicTagProto>(21, _omitFieldNames ? '' : 'authors',
        subBuilder: ComicTagProto.create)
    ..aInt64(22, _omitFieldNames ? '' : 'subscribeNum',
        protoName: 'subscribeNum')
    ..pPM<ComicChapterListProto>(23, _omitFieldNames ? '' : 'chapters',
        subBuilder: ComicChapterListProto.create)
    ..aI(24, _omitFieldNames ? '' : 'isNeedLogin', protoName: 'isNeedLogin')
    ..pPM<ComicDetailUrlLinkProto>(25, _omitFieldNames ? '' : 'urlLinks',
        protoName: 'urlLinks', subBuilder: ComicDetailUrlLinkProto.create)
    ..aI(26, _omitFieldNames ? '' : 'isHideChapter', protoName: 'isHideChapter')
    ..pPM<ComicDetailUrlLinkProto>(27, _omitFieldNames ? '' : 'dhUrlLinks',
        protoName: 'dhUrlLinks', subBuilder: ComicDetailUrlLinkProto.create)
    ..aOS(28, _omitFieldNames ? '' : 'cornerMark', protoName: 'cornerMark')
    ..aI(29, _omitFieldNames ? '' : 'isFee', protoName: 'isFee')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailProto copyWith(void Function(ComicDetailProto) updates) =>
      super.copyWith((message) => updates(message as ComicDetailProto))
          as ComicDetailProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDetailProto create() => ComicDetailProto._();
  @$core.override
  ComicDetailProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicDetailProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicDetailProto>(create);
  static ComicDetailProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get direction => $_getIZ(2);
  @$pb.TagNumber(3)
  set direction($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get islong => $_getIZ(3);
  @$pb.TagNumber(4)
  set islong($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIslong() => $_has(3);
  @$pb.TagNumber(4)
  void clearIslong() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get isDmzj => $_getIZ(4);
  @$pb.TagNumber(5)
  set isDmzj($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsDmzj() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsDmzj() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get cover => $_getSZ(5);
  @$pb.TagNumber(6)
  set cover($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCover() => $_has(5);
  @$pb.TagNumber(6)
  void clearCover() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastUpdatetime => $_getI64(7);
  @$pb.TagNumber(8)
  set lastUpdatetime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastUpdatetime() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastUpdatetime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get lastUpdateChapterName => $_getSZ(8);
  @$pb.TagNumber(9)
  set lastUpdateChapterName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateChapterName() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateChapterName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get copyright => $_getIZ(9);
  @$pb.TagNumber(10)
  set copyright($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCopyright() => $_has(9);
  @$pb.TagNumber(10)
  void clearCopyright() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get firstLetter => $_getSZ(10);
  @$pb.TagNumber(11)
  set firstLetter($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasFirstLetter() => $_has(10);
  @$pb.TagNumber(11)
  void clearFirstLetter() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get comicPy => $_getSZ(11);
  @$pb.TagNumber(12)
  set comicPy($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasComicPy() => $_has(11);
  @$pb.TagNumber(12)
  void clearComicPy() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get hidden => $_getIZ(12);
  @$pb.TagNumber(13)
  set hidden($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasHidden() => $_has(12);
  @$pb.TagNumber(13)
  void clearHidden() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get hotNum => $_getI64(13);
  @$pb.TagNumber(14)
  set hotNum($fixnum.Int64 value) => $_setInt64(13, value);
  @$pb.TagNumber(14)
  $core.bool hasHotNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearHotNum() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get hitNum => $_getI64(14);
  @$pb.TagNumber(15)
  set hitNum($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasHitNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearHitNum() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get uid => $_getI64(15);
  @$pb.TagNumber(16)
  set uid($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasUid() => $_has(15);
  @$pb.TagNumber(16)
  void clearUid() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get isLock => $_getIZ(16);
  @$pb.TagNumber(17)
  set isLock($core.int value) => $_setSignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasIsLock() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsLock() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.int get lastUpdateChapterId => $_getIZ(17);
  @$pb.TagNumber(18)
  set lastUpdateChapterId($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(18)
  $core.bool hasLastUpdateChapterId() => $_has(17);
  @$pb.TagNumber(18)
  void clearLastUpdateChapterId() => $_clearField(18);

  @$pb.TagNumber(19)
  $pb.PbList<ComicTagProto> get types => $_getList(18);

  @$pb.TagNumber(20)
  $pb.PbList<ComicTagProto> get status => $_getList(19);

  @$pb.TagNumber(21)
  $pb.PbList<ComicTagProto> get authors => $_getList(20);

  @$pb.TagNumber(22)
  $fixnum.Int64 get subscribeNum => $_getI64(21);
  @$pb.TagNumber(22)
  set subscribeNum($fixnum.Int64 value) => $_setInt64(21, value);
  @$pb.TagNumber(22)
  $core.bool hasSubscribeNum() => $_has(21);
  @$pb.TagNumber(22)
  void clearSubscribeNum() => $_clearField(22);

  @$pb.TagNumber(23)
  $pb.PbList<ComicChapterListProto> get chapters => $_getList(22);

  @$pb.TagNumber(24)
  $core.int get isNeedLogin => $_getIZ(23);
  @$pb.TagNumber(24)
  set isNeedLogin($core.int value) => $_setSignedInt32(23, value);
  @$pb.TagNumber(24)
  $core.bool hasIsNeedLogin() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsNeedLogin() => $_clearField(24);

  @$pb.TagNumber(25)
  $pb.PbList<ComicDetailUrlLinkProto> get urlLinks => $_getList(24);

  @$pb.TagNumber(26)
  $core.int get isHideChapter => $_getIZ(25);
  @$pb.TagNumber(26)
  set isHideChapter($core.int value) => $_setSignedInt32(25, value);
  @$pb.TagNumber(26)
  $core.bool hasIsHideChapter() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsHideChapter() => $_clearField(26);

  @$pb.TagNumber(27)
  $pb.PbList<ComicDetailUrlLinkProto> get dhUrlLinks => $_getList(26);

  @$pb.TagNumber(28)
  $core.String get cornerMark => $_getSZ(27);
  @$pb.TagNumber(28)
  set cornerMark($core.String value) => $_setString(27, value);
  @$pb.TagNumber(28)
  $core.bool hasCornerMark() => $_has(27);
  @$pb.TagNumber(28)
  void clearCornerMark() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.int get isFee => $_getIZ(28);
  @$pb.TagNumber(29)
  set isFee($core.int value) => $_setSignedInt32(28, value);
  @$pb.TagNumber(29)
  $core.bool hasIsFee() => $_has(28);
  @$pb.TagNumber(29)
  void clearIsFee() => $_clearField(29);
}

class ComicTagProto extends $pb.GeneratedMessage {
  factory ComicTagProto({
    $fixnum.Int64? tagId,
    $core.String? tagName,
  }) {
    final result = create();
    if (tagId != null) result.tagId = tagId;
    if (tagName != null) result.tagName = tagName;
    return result;
  }

  ComicTagProto._();

  factory ComicTagProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicTagProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicTagProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'tagId', protoName: 'tagId')
    ..aOS(2, _omitFieldNames ? '' : 'tagName', protoName: 'tagName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicTagProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicTagProto copyWith(void Function(ComicTagProto) updates) =>
      super.copyWith((message) => updates(message as ComicTagProto))
          as ComicTagProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicTagProto create() => ComicTagProto._();
  @$core.override
  ComicTagProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicTagProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicTagProto>(create);
  static ComicTagProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get tagId => $_getI64(0);
  @$pb.TagNumber(1)
  set tagId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => $_clearField(2);
}

class ComicDetailUrlLinkProto extends $pb.GeneratedMessage {
  factory ComicDetailUrlLinkProto({
    $core.String? title,
    $core.Iterable<ComicDetailUrlProto>? list,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (list != null) result.list.addAll(list);
    return result;
  }

  ComicDetailUrlLinkProto._();

  factory ComicDetailUrlLinkProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicDetailUrlLinkProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicDetailUrlLinkProto',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..pPM<ComicDetailUrlProto>(2, _omitFieldNames ? '' : 'list',
        subBuilder: ComicDetailUrlProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailUrlLinkProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailUrlLinkProto copyWith(
          void Function(ComicDetailUrlLinkProto) updates) =>
      super.copyWith((message) => updates(message as ComicDetailUrlLinkProto))
          as ComicDetailUrlLinkProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDetailUrlLinkProto create() => ComicDetailUrlLinkProto._();
  @$core.override
  ComicDetailUrlLinkProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicDetailUrlLinkProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicDetailUrlLinkProto>(create);
  static ComicDetailUrlLinkProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ComicDetailUrlProto> get list => $_getList(1);
}

class ComicDetailUrlProto extends $pb.GeneratedMessage {
  factory ComicDetailUrlProto({
    $fixnum.Int64? id,
    $core.String? title,
    $core.String? url,
    $core.String? icon,
    $core.String? packageName,
    $core.String? dUrl,
    $core.int? btype,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (url != null) result.url = url;
    if (icon != null) result.icon = icon;
    if (packageName != null) result.packageName = packageName;
    if (dUrl != null) result.dUrl = dUrl;
    if (btype != null) result.btype = btype;
    return result;
  }

  ComicDetailUrlProto._();

  factory ComicDetailUrlProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicDetailUrlProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicDetailUrlProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'packageName', protoName: 'packageName')
    ..aOS(6, _omitFieldNames ? '' : 'dUrl', protoName: 'dUrl')
    ..aI(7, _omitFieldNames ? '' : 'btype')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailUrlProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicDetailUrlProto copyWith(void Function(ComicDetailUrlProto) updates) =>
      super.copyWith((message) => updates(message as ComicDetailUrlProto))
          as ComicDetailUrlProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicDetailUrlProto create() => ComicDetailUrlProto._();
  @$core.override
  ComicDetailUrlProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicDetailUrlProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicDetailUrlProto>(create);
  static ComicDetailUrlProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get packageName => $_getSZ(4);
  @$pb.TagNumber(5)
  set packageName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPackageName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPackageName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get dUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set dUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearDUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get btype => $_getIZ(6);
  @$pb.TagNumber(7)
  set btype($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBtype() => $_has(6);
  @$pb.TagNumber(7)
  void clearBtype() => $_clearField(7);
}

class ComicRankListResponseProto extends $pb.GeneratedMessage {
  factory ComicRankListResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    $core.Iterable<ComicRankListInfoProto>? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data.addAll(data);
    return result;
  }

  ComicRankListResponseProto._();

  factory ComicRankListResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicRankListResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicRankListResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..pPM<ComicRankListInfoProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: ComicRankListInfoProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicRankListResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicRankListResponseProto copyWith(
          void Function(ComicRankListResponseProto) updates) =>
      super.copyWith(
              (message) => updates(message as ComicRankListResponseProto))
          as ComicRankListResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicRankListResponseProto create() => ComicRankListResponseProto._();
  @$core.override
  ComicRankListResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicRankListResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicRankListResponseProto>(create);
  static ComicRankListResponseProto? _defaultInstance;

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
  $pb.PbList<ComicRankListInfoProto> get data => $_getList(2);
}

class ComicRankListInfoProto extends $pb.GeneratedMessage {
  factory ComicRankListInfoProto({
    $fixnum.Int64? comicId,
    $core.String? title,
    $core.String? authors,
    $core.String? status,
    $core.String? cover,
    $core.String? types,
    $fixnum.Int64? lastUpdatetime,
    $core.String? lastUpdateChapterName,
    $core.String? comicPy,
    $fixnum.Int64? num,
    $core.int? tagId,
    $core.String? chapterName,
    $fixnum.Int64? chapterId,
  }) {
    final result = create();
    if (comicId != null) result.comicId = comicId;
    if (title != null) result.title = title;
    if (authors != null) result.authors = authors;
    if (status != null) result.status = status;
    if (cover != null) result.cover = cover;
    if (types != null) result.types = types;
    if (lastUpdatetime != null) result.lastUpdatetime = lastUpdatetime;
    if (lastUpdateChapterName != null)
      result.lastUpdateChapterName = lastUpdateChapterName;
    if (comicPy != null) result.comicPy = comicPy;
    if (num != null) result.num = num;
    if (tagId != null) result.tagId = tagId;
    if (chapterName != null) result.chapterName = chapterName;
    if (chapterId != null) result.chapterId = chapterId;
    return result;
  }

  ComicRankListInfoProto._();

  factory ComicRankListInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicRankListInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicRankListInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'comicId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'authors')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'cover')
    ..aOS(6, _omitFieldNames ? '' : 'types')
    ..aInt64(7, _omitFieldNames ? '' : 'lastUpdatetime')
    ..aOS(8, _omitFieldNames ? '' : 'lastUpdateChapterName')
    ..aOS(9, _omitFieldNames ? '' : 'comicPy')
    ..aInt64(10, _omitFieldNames ? '' : 'num')
    ..aI(11, _omitFieldNames ? '' : 'tagId')
    ..aOS(12, _omitFieldNames ? '' : 'chapterName')
    ..aInt64(13, _omitFieldNames ? '' : 'chapterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicRankListInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicRankListInfoProto copyWith(
          void Function(ComicRankListInfoProto) updates) =>
      super.copyWith((message) => updates(message as ComicRankListInfoProto))
          as ComicRankListInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicRankListInfoProto create() => ComicRankListInfoProto._();
  @$core.override
  ComicRankListInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicRankListInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicRankListInfoProto>(create);
  static ComicRankListInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get comicId => $_getI64(0);
  @$pb.TagNumber(1)
  set comicId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasComicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearComicId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get authors => $_getSZ(2);
  @$pb.TagNumber(3)
  set authors($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAuthors() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthors() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get types => $_getSZ(5);
  @$pb.TagNumber(6)
  set types($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTypes() => $_has(5);
  @$pb.TagNumber(6)
  void clearTypes() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastUpdatetime => $_getI64(6);
  @$pb.TagNumber(7)
  set lastUpdatetime($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastUpdatetime() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdatetime() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get lastUpdateChapterName => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastUpdateChapterName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastUpdateChapterName() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastUpdateChapterName() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get comicPy => $_getSZ(8);
  @$pb.TagNumber(9)
  set comicPy($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasComicPy() => $_has(8);
  @$pb.TagNumber(9)
  void clearComicPy() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get num => $_getI64(9);
  @$pb.TagNumber(10)
  set num($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearNum() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get tagId => $_getIZ(10);
  @$pb.TagNumber(11)
  set tagId($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTagId() => $_has(10);
  @$pb.TagNumber(11)
  void clearTagId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get chapterName => $_getSZ(11);
  @$pb.TagNumber(12)
  set chapterName($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasChapterName() => $_has(11);
  @$pb.TagNumber(12)
  void clearChapterName() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get chapterId => $_getI64(12);
  @$pb.TagNumber(13)
  set chapterId($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasChapterId() => $_has(12);
  @$pb.TagNumber(13)
  void clearChapterId() => $_clearField(13);
}

class RankTypeFilterResponseProto extends $pb.GeneratedMessage {
  factory RankTypeFilterResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    $core.Iterable<ComicTagProto>? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data.addAll(data);
    return result;
  }

  RankTypeFilterResponseProto._();

  factory RankTypeFilterResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RankTypeFilterResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RankTypeFilterResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..pPM<ComicTagProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: ComicTagProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankTypeFilterResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankTypeFilterResponseProto copyWith(
          void Function(RankTypeFilterResponseProto) updates) =>
      super.copyWith(
              (message) => updates(message as RankTypeFilterResponseProto))
          as RankTypeFilterResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RankTypeFilterResponseProto create() =>
      RankTypeFilterResponseProto._();
  @$core.override
  RankTypeFilterResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RankTypeFilterResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RankTypeFilterResponseProto>(create);
  static RankTypeFilterResponseProto? _defaultInstance;

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
  $pb.PbList<ComicTagProto> get data => $_getList(2);
}

class ComicUpdateListResponseProto extends $pb.GeneratedMessage {
  factory ComicUpdateListResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    $core.Iterable<ComicUpdateListInfoProto>? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data.addAll(data);
    return result;
  }

  ComicUpdateListResponseProto._();

  factory ComicUpdateListResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicUpdateListResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicUpdateListResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..pPM<ComicUpdateListInfoProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: ComicUpdateListInfoProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicUpdateListResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicUpdateListResponseProto copyWith(
          void Function(ComicUpdateListResponseProto) updates) =>
      super.copyWith(
              (message) => updates(message as ComicUpdateListResponseProto))
          as ComicUpdateListResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicUpdateListResponseProto create() =>
      ComicUpdateListResponseProto._();
  @$core.override
  ComicUpdateListResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicUpdateListResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicUpdateListResponseProto>(create);
  static ComicUpdateListResponseProto? _defaultInstance;

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
  $pb.PbList<ComicUpdateListInfoProto> get data => $_getList(2);
}

class ComicUpdateListInfoProto extends $pb.GeneratedMessage {
  factory ComicUpdateListInfoProto({
    $fixnum.Int64? comicId,
    $core.String? title,
    $core.int? islong,
    $core.String? authors,
    $core.String? types,
    $core.String? cover,
    $core.String? status,
    $core.String? lastUpdateChapterName,
    $fixnum.Int64? lastUpdateChapterId,
    $fixnum.Int64? lastUpdatetime,
  }) {
    final result = create();
    if (comicId != null) result.comicId = comicId;
    if (title != null) result.title = title;
    if (islong != null) result.islong = islong;
    if (authors != null) result.authors = authors;
    if (types != null) result.types = types;
    if (cover != null) result.cover = cover;
    if (status != null) result.status = status;
    if (lastUpdateChapterName != null)
      result.lastUpdateChapterName = lastUpdateChapterName;
    if (lastUpdateChapterId != null)
      result.lastUpdateChapterId = lastUpdateChapterId;
    if (lastUpdatetime != null) result.lastUpdatetime = lastUpdatetime;
    return result;
  }

  ComicUpdateListInfoProto._();

  factory ComicUpdateListInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComicUpdateListInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComicUpdateListInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'comicId', protoName: 'comicId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aI(3, _omitFieldNames ? '' : 'islong')
    ..aOS(4, _omitFieldNames ? '' : 'authors')
    ..aOS(5, _omitFieldNames ? '' : 'types')
    ..aOS(6, _omitFieldNames ? '' : 'cover')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'lastUpdateChapterName',
        protoName: 'lastUpdateChapterName')
    ..aInt64(9, _omitFieldNames ? '' : 'lastUpdateChapterId',
        protoName: 'lastUpdateChapterId')
    ..aInt64(10, _omitFieldNames ? '' : 'lastUpdatetime',
        protoName: 'lastUpdatetime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicUpdateListInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComicUpdateListInfoProto copyWith(
          void Function(ComicUpdateListInfoProto) updates) =>
      super.copyWith((message) => updates(message as ComicUpdateListInfoProto))
          as ComicUpdateListInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComicUpdateListInfoProto create() => ComicUpdateListInfoProto._();
  @$core.override
  ComicUpdateListInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComicUpdateListInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComicUpdateListInfoProto>(create);
  static ComicUpdateListInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get comicId => $_getI64(0);
  @$pb.TagNumber(1)
  set comicId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasComicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearComicId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get islong => $_getIZ(2);
  @$pb.TagNumber(3)
  set islong($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIslong() => $_has(2);
  @$pb.TagNumber(3)
  void clearIslong() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get authors => $_getSZ(3);
  @$pb.TagNumber(4)
  set authors($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAuthors() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthors() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get types => $_getSZ(4);
  @$pb.TagNumber(5)
  set types($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTypes() => $_has(4);
  @$pb.TagNumber(5)
  void clearTypes() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get cover => $_getSZ(5);
  @$pb.TagNumber(6)
  set cover($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCover() => $_has(5);
  @$pb.TagNumber(6)
  void clearCover() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get lastUpdateChapterName => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastUpdateChapterName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastUpdateChapterName() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastUpdateChapterName() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get lastUpdateChapterId => $_getI64(8);
  @$pb.TagNumber(9)
  set lastUpdateChapterId($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateChapterId() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateChapterId() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get lastUpdatetime => $_getI64(9);
  @$pb.TagNumber(10)
  set lastUpdatetime($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatetime() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatetime() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
