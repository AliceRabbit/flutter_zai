// This is a generated file - do not edit.
//
// Generated from news.proto.

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

class NewsListResponseProto extends $pb.GeneratedMessage {
  factory NewsListResponseProto({
    $core.int? errno,
    $core.String? errmsg,
    $core.Iterable<NewsListInfoProto>? data,
  }) {
    final result = create();
    if (errno != null) result.errno = errno;
    if (errmsg != null) result.errmsg = errmsg;
    if (data != null) result.data.addAll(data);
    return result;
  }

  NewsListResponseProto._();

  factory NewsListResponseProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsListResponseProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsListResponseProto',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errno')
    ..aOS(2, _omitFieldNames ? '' : 'errmsg')
    ..pPM<NewsListInfoProto>(3, _omitFieldNames ? '' : 'data',
        subBuilder: NewsListInfoProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsListResponseProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsListResponseProto copyWith(
          void Function(NewsListResponseProto) updates) =>
      super.copyWith((message) => updates(message as NewsListResponseProto))
          as NewsListResponseProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsListResponseProto create() => NewsListResponseProto._();
  @$core.override
  NewsListResponseProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsListResponseProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsListResponseProto>(create);
  static NewsListResponseProto? _defaultInstance;

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
  $pb.PbList<NewsListInfoProto> get data => $_getList(2);
}

class NewsListInfoProto extends $pb.GeneratedMessage {
  factory NewsListInfoProto({
    $fixnum.Int64? articleId,
    $core.String? title,
    $core.String? fromName,
    $core.String? fromUrl,
    $fixnum.Int64? createTime,
    $core.int? isForeign,
    $core.String? foreignUrl,
    $core.String? intro,
    $fixnum.Int64? authorId,
    $core.int? status,
    $core.String? rowPicUrl,
    $core.String? colPicUrl,
    $core.int? qchatShow,
    $core.String? pageUrl,
    $fixnum.Int64? commentAmount,
    $fixnum.Int64? authorUid,
    $core.String? cover,
    $core.String? nickname,
    $fixnum.Int64? moodAmount,
  }) {
    final result = create();
    if (articleId != null) result.articleId = articleId;
    if (title != null) result.title = title;
    if (fromName != null) result.fromName = fromName;
    if (fromUrl != null) result.fromUrl = fromUrl;
    if (createTime != null) result.createTime = createTime;
    if (isForeign != null) result.isForeign = isForeign;
    if (foreignUrl != null) result.foreignUrl = foreignUrl;
    if (intro != null) result.intro = intro;
    if (authorId != null) result.authorId = authorId;
    if (status != null) result.status = status;
    if (rowPicUrl != null) result.rowPicUrl = rowPicUrl;
    if (colPicUrl != null) result.colPicUrl = colPicUrl;
    if (qchatShow != null) result.qchatShow = qchatShow;
    if (pageUrl != null) result.pageUrl = pageUrl;
    if (commentAmount != null) result.commentAmount = commentAmount;
    if (authorUid != null) result.authorUid = authorUid;
    if (cover != null) result.cover = cover;
    if (nickname != null) result.nickname = nickname;
    if (moodAmount != null) result.moodAmount = moodAmount;
    return result;
  }

  NewsListInfoProto._();

  factory NewsListInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsListInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsListInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'articleId', protoName: 'articleId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'fromName', protoName: 'fromName')
    ..aOS(4, _omitFieldNames ? '' : 'fromUrl', protoName: 'fromUrl')
    ..aInt64(5, _omitFieldNames ? '' : 'createTime', protoName: 'createTime')
    ..aI(6, _omitFieldNames ? '' : 'isForeign', protoName: 'isForeign')
    ..aOS(7, _omitFieldNames ? '' : 'foreignUrl', protoName: 'foreignUrl')
    ..aOS(8, _omitFieldNames ? '' : 'intro')
    ..aInt64(9, _omitFieldNames ? '' : 'authorId', protoName: 'authorId')
    ..aI(10, _omitFieldNames ? '' : 'status')
    ..aOS(11, _omitFieldNames ? '' : 'rowPicUrl', protoName: 'rowPicUrl')
    ..aOS(12, _omitFieldNames ? '' : 'colPicUrl', protoName: 'colPicUrl')
    ..aI(13, _omitFieldNames ? '' : 'qchatShow', protoName: 'qchatShow')
    ..aOS(14, _omitFieldNames ? '' : 'pageUrl', protoName: 'pageUrl')
    ..aInt64(15, _omitFieldNames ? '' : 'commentAmount',
        protoName: 'commentAmount')
    ..aInt64(16, _omitFieldNames ? '' : 'authorUid', protoName: 'authorUid')
    ..aOS(17, _omitFieldNames ? '' : 'cover')
    ..aOS(18, _omitFieldNames ? '' : 'nickname')
    ..aInt64(19, _omitFieldNames ? '' : 'moodAmount', protoName: 'moodAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsListInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsListInfoProto copyWith(void Function(NewsListInfoProto) updates) =>
      super.copyWith((message) => updates(message as NewsListInfoProto))
          as NewsListInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsListInfoProto create() => NewsListInfoProto._();
  @$core.override
  NewsListInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsListInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsListInfoProto>(create);
  static NewsListInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get articleId => $_getI64(0);
  @$pb.TagNumber(1)
  set articleId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArticleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArticleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFromName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fromUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set fromUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFromUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTime => $_getI64(4);
  @$pb.TagNumber(5)
  set createTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get isForeign => $_getIZ(5);
  @$pb.TagNumber(6)
  set isForeign($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsForeign() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsForeign() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get foreignUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set foreignUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasForeignUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearForeignUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get intro => $_getSZ(7);
  @$pb.TagNumber(8)
  set intro($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIntro() => $_has(7);
  @$pb.TagNumber(8)
  void clearIntro() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get authorId => $_getI64(8);
  @$pb.TagNumber(9)
  set authorId($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAuthorId() => $_has(8);
  @$pb.TagNumber(9)
  void clearAuthorId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get status => $_getIZ(9);
  @$pb.TagNumber(10)
  set status($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get rowPicUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set rowPicUrl($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRowPicUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearRowPicUrl() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get colPicUrl => $_getSZ(11);
  @$pb.TagNumber(12)
  set colPicUrl($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasColPicUrl() => $_has(11);
  @$pb.TagNumber(12)
  void clearColPicUrl() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get qchatShow => $_getIZ(12);
  @$pb.TagNumber(13)
  set qchatShow($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasQchatShow() => $_has(12);
  @$pb.TagNumber(13)
  void clearQchatShow() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get pageUrl => $_getSZ(13);
  @$pb.TagNumber(14)
  set pageUrl($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasPageUrl() => $_has(13);
  @$pb.TagNumber(14)
  void clearPageUrl() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get commentAmount => $_getI64(14);
  @$pb.TagNumber(15)
  set commentAmount($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasCommentAmount() => $_has(14);
  @$pb.TagNumber(15)
  void clearCommentAmount() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get authorUid => $_getI64(15);
  @$pb.TagNumber(16)
  set authorUid($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasAuthorUid() => $_has(15);
  @$pb.TagNumber(16)
  void clearAuthorUid() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get cover => $_getSZ(16);
  @$pb.TagNumber(17)
  set cover($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasCover() => $_has(16);
  @$pb.TagNumber(17)
  void clearCover() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get nickname => $_getSZ(17);
  @$pb.TagNumber(18)
  set nickname($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasNickname() => $_has(17);
  @$pb.TagNumber(18)
  void clearNickname() => $_clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get moodAmount => $_getI64(18);
  @$pb.TagNumber(19)
  set moodAmount($fixnum.Int64 value) => $_setInt64(18, value);
  @$pb.TagNumber(19)
  $core.bool hasMoodAmount() => $_has(18);
  @$pb.TagNumber(19)
  void clearMoodAmount() => $_clearField(19);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
