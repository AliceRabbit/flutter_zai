// This is a generated file - do not edit.
//
// Generated from news.proto.

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

@$core.Deprecated('Use newsListResponseProtoDescriptor instead')
const NewsListResponseProto$json = {
  '1': 'NewsListResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.NewsListInfoProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `NewsListResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsListResponseProtoDescriptor = $convert.base64Decode(
    'ChVOZXdzTGlzdFJlc3BvbnNlUHJvdG8SFAoFZXJybm8YASABKAVSBWVycm5vEhYKBmVycm1zZx'
    'gCIAEoCVIGZXJybXNnEiYKBGRhdGEYAyADKAsyEi5OZXdzTGlzdEluZm9Qcm90b1IEZGF0YQ==');

@$core.Deprecated('Use newsListInfoProtoDescriptor instead')
const NewsListInfoProto$json = {
  '1': 'NewsListInfoProto',
  '2': [
    {'1': 'articleId', '3': 1, '4': 1, '5': 3, '10': 'articleId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'fromName', '3': 3, '4': 1, '5': 9, '10': 'fromName'},
    {'1': 'fromUrl', '3': 4, '4': 1, '5': 9, '10': 'fromUrl'},
    {'1': 'createTime', '3': 5, '4': 1, '5': 3, '10': 'createTime'},
    {'1': 'isForeign', '3': 6, '4': 1, '5': 5, '10': 'isForeign'},
    {'1': 'foreignUrl', '3': 7, '4': 1, '5': 9, '10': 'foreignUrl'},
    {'1': 'intro', '3': 8, '4': 1, '5': 9, '10': 'intro'},
    {'1': 'authorId', '3': 9, '4': 1, '5': 3, '10': 'authorId'},
    {'1': 'status', '3': 10, '4': 1, '5': 5, '10': 'status'},
    {'1': 'rowPicUrl', '3': 11, '4': 1, '5': 9, '10': 'rowPicUrl'},
    {'1': 'colPicUrl', '3': 12, '4': 1, '5': 9, '10': 'colPicUrl'},
    {'1': 'qchatShow', '3': 13, '4': 1, '5': 5, '10': 'qchatShow'},
    {'1': 'pageUrl', '3': 14, '4': 1, '5': 9, '10': 'pageUrl'},
    {'1': 'commentAmount', '3': 15, '4': 1, '5': 3, '10': 'commentAmount'},
    {'1': 'authorUid', '3': 16, '4': 1, '5': 3, '10': 'authorUid'},
    {'1': 'cover', '3': 17, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'nickname', '3': 18, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'moodAmount', '3': 19, '4': 1, '5': 3, '10': 'moodAmount'},
  ],
};

/// Descriptor for `NewsListInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsListInfoProtoDescriptor = $convert.base64Decode(
    'ChFOZXdzTGlzdEluZm9Qcm90bxIcCglhcnRpY2xlSWQYASABKANSCWFydGljbGVJZBIUCgV0aX'
    'RsZRgCIAEoCVIFdGl0bGUSGgoIZnJvbU5hbWUYAyABKAlSCGZyb21OYW1lEhgKB2Zyb21VcmwY'
    'BCABKAlSB2Zyb21VcmwSHgoKY3JlYXRlVGltZRgFIAEoA1IKY3JlYXRlVGltZRIcCglpc0Zvcm'
    'VpZ24YBiABKAVSCWlzRm9yZWlnbhIeCgpmb3JlaWduVXJsGAcgASgJUgpmb3JlaWduVXJsEhQK'
    'BWludHJvGAggASgJUgVpbnRybxIaCghhdXRob3JJZBgJIAEoA1IIYXV0aG9ySWQSFgoGc3RhdH'
    'VzGAogASgFUgZzdGF0dXMSHAoJcm93UGljVXJsGAsgASgJUglyb3dQaWNVcmwSHAoJY29sUGlj'
    'VXJsGAwgASgJUgljb2xQaWNVcmwSHAoJcWNoYXRTaG93GA0gASgFUglxY2hhdFNob3cSGAoHcG'
    'FnZVVybBgOIAEoCVIHcGFnZVVybBIkCg1jb21tZW50QW1vdW50GA8gASgDUg1jb21tZW50QW1v'
    'dW50EhwKCWF1dGhvclVpZBgQIAEoA1IJYXV0aG9yVWlkEhQKBWNvdmVyGBEgASgJUgVjb3Zlch'
    'IaCghuaWNrbmFtZRgSIAEoCVIIbmlja25hbWUSHgoKbW9vZEFtb3VudBgTIAEoA1IKbW9vZEFt'
    'b3VudA==');
