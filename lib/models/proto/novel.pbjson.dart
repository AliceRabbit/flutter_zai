// This is a generated file - do not edit.
//
// Generated from novel.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use novelChapterDetailProtoDescriptor instead')
const NovelChapterDetailProto$json = {
  '1': 'NovelChapterDetailProto',
  '2': [
    {'1': 'chapterId', '3': 1, '4': 1, '5': 3, '10': 'chapterId'},
    {'1': 'chapterName', '3': 2, '4': 1, '5': 9, '10': 'chapterName'},
    {'1': 'chapterOrder', '3': 3, '4': 1, '5': 5, '10': 'chapterOrder'},
  ],
};

/// Descriptor for `NovelChapterDetailProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List novelChapterDetailProtoDescriptor = $convert.base64Decode(
    'ChdOb3ZlbENoYXB0ZXJEZXRhaWxQcm90bxIcCgljaGFwdGVySWQYASABKANSCWNoYXB0ZXJJZB'
    'IgCgtjaGFwdGVyTmFtZRgCIAEoCVILY2hhcHRlck5hbWUSIgoMY2hhcHRlck9yZGVyGAMgASgF'
    'UgxjaGFwdGVyT3JkZXI=');

@$core.Deprecated('Use novelVolumeProtoDescriptor instead')
const NovelVolumeProto$json = {
  '1': 'NovelVolumeProto',
  '2': [
    {'1': 'volume_id', '3': 1, '4': 1, '5': 3, '10': 'volumeId'},
    {'1': 'lnovel_id', '3': 2, '4': 1, '5': 3, '10': 'lnovelId'},
    {'1': 'volume_name', '3': 3, '4': 1, '5': 9, '10': 'volumeName'},
    {'1': 'volume_order', '3': 4, '4': 1, '5': 5, '10': 'volumeOrder'},
    {'1': 'addtime', '3': 5, '4': 1, '5': 3, '10': 'addtime'},
    {'1': 'sum_chapters', '3': 6, '4': 1, '5': 5, '10': 'sumChapters'},
  ],
};

/// Descriptor for `NovelVolumeProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List novelVolumeProtoDescriptor = $convert.base64Decode(
    'ChBOb3ZlbFZvbHVtZVByb3RvEhsKCXZvbHVtZV9pZBgBIAEoA1IIdm9sdW1lSWQSGwoJbG5vdm'
    'VsX2lkGAIgASgDUghsbm92ZWxJZBIfCgt2b2x1bWVfbmFtZRgDIAEoCVIKdm9sdW1lTmFtZRIh'
    'Cgx2b2x1bWVfb3JkZXIYBCABKAVSC3ZvbHVtZU9yZGVyEhgKB2FkZHRpbWUYBSABKANSB2FkZH'
    'RpbWUSIQoMc3VtX2NoYXB0ZXJzGAYgASgFUgtzdW1DaGFwdGVycw==');

@$core.Deprecated('Use novelChapterResponseProtoDescriptor instead')
const NovelChapterResponseProto$json = {
  '1': 'NovelChapterResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.NovelVolumeDetailProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `NovelChapterResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List novelChapterResponseProtoDescriptor = $convert.base64Decode(
    'ChlOb3ZlbENoYXB0ZXJSZXNwb25zZVByb3RvEhQKBWVycm5vGAEgASgFUgVlcnJubxIWCgZlcn'
    'Jtc2cYAiABKAlSBmVycm1zZxIrCgRkYXRhGAMgAygLMhcuTm92ZWxWb2x1bWVEZXRhaWxQcm90'
    'b1IEZGF0YQ==');

@$core.Deprecated('Use novelVolumeDetailProtoDescriptor instead')
const NovelVolumeDetailProto$json = {
  '1': 'NovelVolumeDetailProto',
  '2': [
    {'1': 'volume_id', '3': 1, '4': 1, '5': 3, '10': 'volumeId'},
    {'1': 'volume_name', '3': 2, '4': 1, '5': 9, '10': 'volumeName'},
    {'1': 'volume_order', '3': 3, '4': 1, '5': 5, '10': 'volumeOrder'},
    {
      '1': 'chapters',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.NovelChapterDetailProto',
      '10': 'chapters'
    },
  ],
};

/// Descriptor for `NovelVolumeDetailProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List novelVolumeDetailProtoDescriptor = $convert.base64Decode(
    'ChZOb3ZlbFZvbHVtZURldGFpbFByb3RvEhsKCXZvbHVtZV9pZBgBIAEoA1IIdm9sdW1lSWQSHw'
    'oLdm9sdW1lX25hbWUYAiABKAlSCnZvbHVtZU5hbWUSIQoMdm9sdW1lX29yZGVyGAMgASgFUgt2'
    'b2x1bWVPcmRlchI0CghjaGFwdGVycxgEIAMoCzIYLk5vdmVsQ2hhcHRlckRldGFpbFByb3RvUg'
    'hjaGFwdGVycw==');

@$core.Deprecated('Use novelDetailProtoDescriptor instead')
const NovelDetailProto$json = {
  '1': 'NovelDetailProto',
  '2': [
    {'1': 'novel_id', '3': 1, '4': 1, '5': 3, '10': 'novelId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'zone', '3': 3, '4': 1, '5': 9, '10': 'zone'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'last_update_volume_name',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'lastUpdateVolumeName'
    },
    {
      '1': 'last_update_chapter_name',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'lastUpdateChapterName'
    },
    {
      '1': 'last_update_volume_id',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'lastUpdateVolumeId'
    },
    {
      '1': 'last_update_chapter_id',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'lastUpdateChapterId'
    },
    {'1': 'last_update_time', '3': 9, '4': 1, '5': 3, '10': 'lastUpdateTime'},
    {'1': 'cover', '3': 10, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'hot_hits', '3': 11, '4': 1, '5': 3, '10': 'hotHits'},
    {'1': 'introduction', '3': 12, '4': 1, '5': 9, '10': 'introduction'},
    {'1': 'types', '3': 13, '4': 3, '5': 9, '10': 'types'},
    {'1': 'authors', '3': 14, '4': 1, '5': 9, '10': 'authors'},
    {'1': 'first_letter', '3': 15, '4': 1, '5': 9, '10': 'firstLetter'},
    {'1': 'subscribe_num', '3': 16, '4': 1, '5': 3, '10': 'subscribeNum'},
    {
      '1': 'redis_update_time',
      '3': 17,
      '4': 1,
      '5': 3,
      '10': 'redisUpdateTime'
    },
    {
      '1': 'volume',
      '3': 18,
      '4': 3,
      '5': 11,
      '6': '.NovelVolumeProto',
      '10': 'volume'
    },
  ],
};

/// Descriptor for `NovelDetailProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List novelDetailProtoDescriptor = $convert.base64Decode(
    'ChBOb3ZlbERldGFpbFByb3RvEhkKCG5vdmVsX2lkGAEgASgDUgdub3ZlbElkEhIKBG5hbWUYAi'
    'ABKAlSBG5hbWUSEgoEem9uZRgDIAEoCVIEem9uZRIWCgZzdGF0dXMYBCABKAlSBnN0YXR1cxI1'
    'ChdsYXN0X3VwZGF0ZV92b2x1bWVfbmFtZRgFIAEoCVIUbGFzdFVwZGF0ZVZvbHVtZU5hbWUSNw'
    'oYbGFzdF91cGRhdGVfY2hhcHRlcl9uYW1lGAYgASgJUhVsYXN0VXBkYXRlQ2hhcHRlck5hbWUS'
    'MQoVbGFzdF91cGRhdGVfdm9sdW1lX2lkGAcgASgDUhJsYXN0VXBkYXRlVm9sdW1lSWQSMwoWbG'
    'FzdF91cGRhdGVfY2hhcHRlcl9pZBgIIAEoA1ITbGFzdFVwZGF0ZUNoYXB0ZXJJZBIoChBsYXN0'
    'X3VwZGF0ZV90aW1lGAkgASgDUg5sYXN0VXBkYXRlVGltZRIUCgVjb3ZlchgKIAEoCVIFY292ZX'
    'ISGQoIaG90X2hpdHMYCyABKANSB2hvdEhpdHMSIgoMaW50cm9kdWN0aW9uGAwgASgJUgxpbnRy'
    'b2R1Y3Rpb24SFAoFdHlwZXMYDSADKAlSBXR5cGVzEhgKB2F1dGhvcnMYDiABKAlSB2F1dGhvcn'
    'MSIQoMZmlyc3RfbGV0dGVyGA8gASgJUgtmaXJzdExldHRlchIjCg1zdWJzY3JpYmVfbnVtGBAg'
    'ASgDUgxzdWJzY3JpYmVOdW0SKgoRcmVkaXNfdXBkYXRlX3RpbWUYESABKANSD3JlZGlzVXBkYX'
    'RlVGltZRIpCgZ2b2x1bWUYEiADKAsyES5Ob3ZlbFZvbHVtZVByb3RvUgZ2b2x1bWU=');

@$core.Deprecated('Use novelDetailResponseProtoDescriptor instead')
const NovelDetailResponseProto$json = {
  '1': 'NovelDetailResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.NovelDetailProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `NovelDetailResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List novelDetailResponseProtoDescriptor = $convert.base64Decode(
    'ChhOb3ZlbERldGFpbFJlc3BvbnNlUHJvdG8SFAoFZXJybm8YASABKAVSBWVycm5vEhYKBmVycm'
    '1zZxgCIAEoCVIGZXJybXNnEiUKBGRhdGEYAyABKAsyES5Ob3ZlbERldGFpbFByb3RvUgRkYXRh');
