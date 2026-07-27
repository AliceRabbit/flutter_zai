// This is a generated file - do not edit.
//
// Generated from comic.proto.

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

@$core.Deprecated('Use comicChapterDetailProtoDescriptor instead')
const ComicChapterDetailProto$json = {
  '1': 'ComicChapterDetailProto',
  '2': [
    {'1': 'chapterId', '3': 1, '4': 1, '5': 3, '10': 'chapterId'},
    {'1': 'comicId', '3': 2, '4': 1, '5': 3, '10': 'comicId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'chapterOrder', '3': 4, '4': 1, '5': 5, '10': 'chapterOrder'},
    {'1': 'direction', '3': 5, '4': 1, '5': 5, '10': 'direction'},
    {'1': 'pageUrl', '3': 6, '4': 3, '5': 9, '10': 'pageUrl'},
    {'1': 'picnum', '3': 7, '4': 1, '5': 5, '10': 'picnum'},
    {'1': 'pageUrlHD', '3': 8, '4': 3, '5': 9, '10': 'pageUrlHD'},
    {'1': 'commentCount', '3': 9, '4': 1, '5': 5, '10': 'commentCount'},
  ],
};

/// Descriptor for `ComicChapterDetailProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicChapterDetailProtoDescriptor = $convert.base64Decode(
    'ChdDb21pY0NoYXB0ZXJEZXRhaWxQcm90bxIcCgljaGFwdGVySWQYASABKANSCWNoYXB0ZXJJZB'
    'IYCgdjb21pY0lkGAIgASgDUgdjb21pY0lkEhQKBXRpdGxlGAMgASgJUgV0aXRsZRIiCgxjaGFw'
    'dGVyT3JkZXIYBCABKAVSDGNoYXB0ZXJPcmRlchIcCglkaXJlY3Rpb24YBSABKAVSCWRpcmVjdG'
    'lvbhIYCgdwYWdlVXJsGAYgAygJUgdwYWdlVXJsEhYKBnBpY251bRgHIAEoBVIGcGljbnVtEhwK'
    'CXBhZ2VVcmxIRBgIIAMoCVIJcGFnZVVybEhEEiIKDGNvbW1lbnRDb3VudBgJIAEoBVIMY29tbW'
    'VudENvdW50');

@$core.Deprecated('Use comicChapterInfoProtoDescriptor instead')
const ComicChapterInfoProto$json = {
  '1': 'ComicChapterInfoProto',
  '2': [
    {'1': 'chapterId', '3': 1, '4': 1, '5': 3, '10': 'chapterId'},
    {'1': 'chapterTitle', '3': 2, '4': 1, '5': 9, '10': 'chapterTitle'},
    {'1': 'updateTime', '3': 3, '4': 1, '5': 3, '10': 'updateTime'},
    {'1': 'fileSize', '3': 4, '4': 1, '5': 5, '10': 'fileSize'},
    {'1': 'chapterOrder', '3': 5, '4': 1, '5': 5, '10': 'chapterOrder'},
    {'1': 'isFee', '3': 6, '4': 1, '5': 5, '10': 'isFee'},
  ],
};

/// Descriptor for `ComicChapterInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicChapterInfoProtoDescriptor = $convert.base64Decode(
    'ChVDb21pY0NoYXB0ZXJJbmZvUHJvdG8SHAoJY2hhcHRlcklkGAEgASgDUgljaGFwdGVySWQSIg'
    'oMY2hhcHRlclRpdGxlGAIgASgJUgxjaGFwdGVyVGl0bGUSHgoKdXBkYXRlVGltZRgDIAEoA1IK'
    'dXBkYXRlVGltZRIaCghmaWxlU2l6ZRgEIAEoBVIIZmlsZVNpemUSIgoMY2hhcHRlck9yZGVyGA'
    'UgASgFUgxjaGFwdGVyT3JkZXISFAoFaXNGZWUYBiABKAVSBWlzRmVl');

@$core.Deprecated('Use comicChapterResponseProtoDescriptor instead')
const ComicChapterResponseProto$json = {
  '1': 'ComicChapterResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ComicChapterDetailProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `ComicChapterResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicChapterResponseProtoDescriptor = $convert.base64Decode(
    'ChlDb21pY0NoYXB0ZXJSZXNwb25zZVByb3RvEhQKBWVycm5vGAEgASgFUgVlcnJubxIWCgZlcn'
    'Jtc2cYAiABKAlSBmVycm1zZxIsCgRkYXRhGAMgASgLMhguQ29taWNDaGFwdGVyRGV0YWlsUHJv'
    'dG9SBGRhdGE=');

@$core.Deprecated('Use comicChapterListProtoDescriptor instead')
const ComicChapterListProto$json = {
  '1': 'ComicChapterListProto',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {
      '1': 'data',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ComicChapterInfoProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `ComicChapterListProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicChapterListProtoDescriptor = $convert.base64Decode(
    'ChVDb21pY0NoYXB0ZXJMaXN0UHJvdG8SFAoFdGl0bGUYASABKAlSBXRpdGxlEioKBGRhdGEYAi'
    'ADKAsyFi5Db21pY0NoYXB0ZXJJbmZvUHJvdG9SBGRhdGE=');

@$core.Deprecated('Use comicDetailResponseProtoDescriptor instead')
const ComicDetailResponseProto$json = {
  '1': 'ComicDetailResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ComicDetailProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `ComicDetailResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDetailResponseProtoDescriptor = $convert.base64Decode(
    'ChhDb21pY0RldGFpbFJlc3BvbnNlUHJvdG8SFAoFZXJybm8YASABKAVSBWVycm5vEhYKBmVycm'
    '1zZxgCIAEoCVIGZXJybXNnEiUKBGRhdGEYAyABKAsyES5Db21pY0RldGFpbFByb3RvUgRkYXRh');

@$core.Deprecated('Use comicDetailProtoDescriptor instead')
const ComicDetailProto$json = {
  '1': 'ComicDetailProto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'direction', '3': 3, '4': 1, '5': 5, '10': 'direction'},
    {'1': 'islong', '3': 4, '4': 1, '5': 5, '10': 'islong'},
    {'1': 'isDmzj', '3': 5, '4': 1, '5': 5, '10': 'isDmzj'},
    {'1': 'cover', '3': 6, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    {'1': 'lastUpdatetime', '3': 8, '4': 1, '5': 3, '10': 'lastUpdatetime'},
    {
      '1': 'lastUpdateChapterName',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'lastUpdateChapterName'
    },
    {'1': 'copyright', '3': 10, '4': 1, '5': 5, '10': 'copyright'},
    {'1': 'firstLetter', '3': 11, '4': 1, '5': 9, '10': 'firstLetter'},
    {'1': 'comicPy', '3': 12, '4': 1, '5': 9, '10': 'comicPy'},
    {'1': 'hidden', '3': 13, '4': 1, '5': 5, '10': 'hidden'},
    {'1': 'hotNum', '3': 14, '4': 1, '5': 3, '10': 'hotNum'},
    {'1': 'hitNum', '3': 15, '4': 1, '5': 3, '10': 'hitNum'},
    {'1': 'uid', '3': 16, '4': 1, '5': 3, '10': 'uid'},
    {'1': 'isLock', '3': 17, '4': 1, '5': 5, '10': 'isLock'},
    {
      '1': 'lastUpdateChapterId',
      '3': 18,
      '4': 1,
      '5': 5,
      '10': 'lastUpdateChapterId'
    },
    {
      '1': 'types',
      '3': 19,
      '4': 3,
      '5': 11,
      '6': '.ComicTagProto',
      '10': 'types'
    },
    {
      '1': 'status',
      '3': 20,
      '4': 3,
      '5': 11,
      '6': '.ComicTagProto',
      '10': 'status'
    },
    {
      '1': 'authors',
      '3': 21,
      '4': 3,
      '5': 11,
      '6': '.ComicTagProto',
      '10': 'authors'
    },
    {'1': 'subscribeNum', '3': 22, '4': 1, '5': 3, '10': 'subscribeNum'},
    {
      '1': 'chapters',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.ComicChapterListProto',
      '10': 'chapters'
    },
    {'1': 'isNeedLogin', '3': 24, '4': 1, '5': 5, '10': 'isNeedLogin'},
    {
      '1': 'urlLinks',
      '3': 25,
      '4': 3,
      '5': 11,
      '6': '.ComicDetailUrlLinkProto',
      '10': 'urlLinks'
    },
    {'1': 'isHideChapter', '3': 26, '4': 1, '5': 5, '10': 'isHideChapter'},
    {
      '1': 'dhUrlLinks',
      '3': 27,
      '4': 3,
      '5': 11,
      '6': '.ComicDetailUrlLinkProto',
      '10': 'dhUrlLinks'
    },
    {'1': 'cornerMark', '3': 28, '4': 1, '5': 9, '10': 'cornerMark'},
    {'1': 'isFee', '3': 29, '4': 1, '5': 5, '10': 'isFee'},
  ],
};

/// Descriptor for `ComicDetailProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDetailProtoDescriptor = $convert.base64Decode(
    'ChBDb21pY0RldGFpbFByb3RvEg4KAmlkGAEgASgDUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bG'
    'USHAoJZGlyZWN0aW9uGAMgASgFUglkaXJlY3Rpb24SFgoGaXNsb25nGAQgASgFUgZpc2xvbmcS'
    'FgoGaXNEbXpqGAUgASgFUgZpc0RtemoSFAoFY292ZXIYBiABKAlSBWNvdmVyEiAKC2Rlc2NyaX'
    'B0aW9uGAcgASgJUgtkZXNjcmlwdGlvbhImCg5sYXN0VXBkYXRldGltZRgIIAEoA1IObGFzdFVw'
    'ZGF0ZXRpbWUSNAoVbGFzdFVwZGF0ZUNoYXB0ZXJOYW1lGAkgASgJUhVsYXN0VXBkYXRlQ2hhcH'
    'Rlck5hbWUSHAoJY29weXJpZ2h0GAogASgFUgljb3B5cmlnaHQSIAoLZmlyc3RMZXR0ZXIYCyAB'
    'KAlSC2ZpcnN0TGV0dGVyEhgKB2NvbWljUHkYDCABKAlSB2NvbWljUHkSFgoGaGlkZGVuGA0gAS'
    'gFUgZoaWRkZW4SFgoGaG90TnVtGA4gASgDUgZob3ROdW0SFgoGaGl0TnVtGA8gASgDUgZoaXRO'
    'dW0SEAoDdWlkGBAgASgDUgN1aWQSFgoGaXNMb2NrGBEgASgFUgZpc0xvY2sSMAoTbGFzdFVwZG'
    'F0ZUNoYXB0ZXJJZBgSIAEoBVITbGFzdFVwZGF0ZUNoYXB0ZXJJZBIkCgV0eXBlcxgTIAMoCzIO'
    'LkNvbWljVGFnUHJvdG9SBXR5cGVzEiYKBnN0YXR1cxgUIAMoCzIOLkNvbWljVGFnUHJvdG9SBn'
    'N0YXR1cxIoCgdhdXRob3JzGBUgAygLMg4uQ29taWNUYWdQcm90b1IHYXV0aG9ycxIiCgxzdWJz'
    'Y3JpYmVOdW0YFiABKANSDHN1YnNjcmliZU51bRIyCghjaGFwdGVycxgXIAMoCzIWLkNvbWljQ2'
    'hhcHRlckxpc3RQcm90b1IIY2hhcHRlcnMSIAoLaXNOZWVkTG9naW4YGCABKAVSC2lzTmVlZExv'
    'Z2luEjQKCHVybExpbmtzGBkgAygLMhguQ29taWNEZXRhaWxVcmxMaW5rUHJvdG9SCHVybExpbm'
    'tzEiQKDWlzSGlkZUNoYXB0ZXIYGiABKAVSDWlzSGlkZUNoYXB0ZXISOAoKZGhVcmxMaW5rcxgb'
    'IAMoCzIYLkNvbWljRGV0YWlsVXJsTGlua1Byb3RvUgpkaFVybExpbmtzEh4KCmNvcm5lck1hcm'
    'sYHCABKAlSCmNvcm5lck1hcmsSFAoFaXNGZWUYHSABKAVSBWlzRmVl');

@$core.Deprecated('Use comicTagProtoDescriptor instead')
const ComicTagProto$json = {
  '1': 'ComicTagProto',
  '2': [
    {'1': 'tagId', '3': 1, '4': 1, '5': 3, '10': 'tagId'},
    {'1': 'tagName', '3': 2, '4': 1, '5': 9, '10': 'tagName'},
  ],
};

/// Descriptor for `ComicTagProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicTagProtoDescriptor = $convert.base64Decode(
    'Cg1Db21pY1RhZ1Byb3RvEhQKBXRhZ0lkGAEgASgDUgV0YWdJZBIYCgd0YWdOYW1lGAIgASgJUg'
    'd0YWdOYW1l');

@$core.Deprecated('Use comicDetailUrlLinkProtoDescriptor instead')
const ComicDetailUrlLinkProto$json = {
  '1': 'ComicDetailUrlLinkProto',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {
      '1': 'list',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ComicDetailUrlProto',
      '10': 'list'
    },
  ],
};

/// Descriptor for `ComicDetailUrlLinkProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDetailUrlLinkProtoDescriptor =
    $convert.base64Decode(
        'ChdDb21pY0RldGFpbFVybExpbmtQcm90bxIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSKAoEbGlzdB'
        'gCIAMoCzIULkNvbWljRGV0YWlsVXJsUHJvdG9SBGxpc3Q=');

@$core.Deprecated('Use comicDetailUrlProtoDescriptor instead')
const ComicDetailUrlProto$json = {
  '1': 'ComicDetailUrlProto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'packageName', '3': 5, '4': 1, '5': 9, '10': 'packageName'},
    {'1': 'dUrl', '3': 6, '4': 1, '5': 9, '10': 'dUrl'},
    {'1': 'btype', '3': 7, '4': 1, '5': 5, '10': 'btype'},
  ],
};

/// Descriptor for `ComicDetailUrlProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicDetailUrlProtoDescriptor = $convert.base64Decode(
    'ChNDb21pY0RldGFpbFVybFByb3RvEg4KAmlkGAEgASgDUgJpZBIUCgV0aXRsZRgCIAEoCVIFdG'
    'l0bGUSEAoDdXJsGAMgASgJUgN1cmwSEgoEaWNvbhgEIAEoCVIEaWNvbhIgCgtwYWNrYWdlTmFt'
    'ZRgFIAEoCVILcGFja2FnZU5hbWUSEgoEZFVybBgGIAEoCVIEZFVybBIUCgVidHlwZRgHIAEoBV'
    'IFYnR5cGU=');

@$core.Deprecated('Use comicRankListResponseProtoDescriptor instead')
const ComicRankListResponseProto$json = {
  '1': 'ComicRankListResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ComicRankListInfoProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `ComicRankListResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicRankListResponseProtoDescriptor =
    $convert.base64Decode(
        'ChpDb21pY1JhbmtMaXN0UmVzcG9uc2VQcm90bxIUCgVlcnJubxgBIAEoBVIFZXJybm8SFgoGZX'
        'JybXNnGAIgASgJUgZlcnJtc2cSKwoEZGF0YRgDIAMoCzIXLkNvbWljUmFua0xpc3RJbmZvUHJv'
        'dG9SBGRhdGE=');

@$core.Deprecated('Use comicRankListInfoProtoDescriptor instead')
const ComicRankListInfoProto$json = {
  '1': 'ComicRankListInfoProto',
  '2': [
    {'1': 'comic_id', '3': 1, '4': 1, '5': 3, '10': 'comicId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'authors', '3': 3, '4': 1, '5': 9, '10': 'authors'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {'1': 'cover', '3': 5, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'types', '3': 6, '4': 1, '5': 9, '10': 'types'},
    {'1': 'last_updatetime', '3': 7, '4': 1, '5': 3, '10': 'lastUpdatetime'},
    {
      '1': 'last_update_chapter_name',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'lastUpdateChapterName'
    },
    {'1': 'comic_py', '3': 9, '4': 1, '5': 9, '10': 'comicPy'},
    {'1': 'num', '3': 10, '4': 1, '5': 3, '10': 'num'},
    {'1': 'tag_id', '3': 11, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'chapter_name', '3': 12, '4': 1, '5': 9, '10': 'chapterName'},
    {'1': 'chapter_id', '3': 13, '4': 1, '5': 3, '10': 'chapterId'},
  ],
};

/// Descriptor for `ComicRankListInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicRankListInfoProtoDescriptor = $convert.base64Decode(
    'ChZDb21pY1JhbmtMaXN0SW5mb1Byb3RvEhkKCGNvbWljX2lkGAEgASgDUgdjb21pY0lkEhQKBX'
    'RpdGxlGAIgASgJUgV0aXRsZRIYCgdhdXRob3JzGAMgASgJUgdhdXRob3JzEhYKBnN0YXR1cxgE'
    'IAEoCVIGc3RhdHVzEhQKBWNvdmVyGAUgASgJUgVjb3ZlchIUCgV0eXBlcxgGIAEoCVIFdHlwZX'
    'MSJwoPbGFzdF91cGRhdGV0aW1lGAcgASgDUg5sYXN0VXBkYXRldGltZRI3ChhsYXN0X3VwZGF0'
    'ZV9jaGFwdGVyX25hbWUYCCABKAlSFWxhc3RVcGRhdGVDaGFwdGVyTmFtZRIZCghjb21pY19weR'
    'gJIAEoCVIHY29taWNQeRIQCgNudW0YCiABKANSA251bRIVCgZ0YWdfaWQYCyABKAVSBXRhZ0lk'
    'EiEKDGNoYXB0ZXJfbmFtZRgMIAEoCVILY2hhcHRlck5hbWUSHQoKY2hhcHRlcl9pZBgNIAEoA1'
    'IJY2hhcHRlcklk');

@$core.Deprecated('Use rankTypeFilterResponseProtoDescriptor instead')
const RankTypeFilterResponseProto$json = {
  '1': 'RankTypeFilterResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {'1': 'data', '3': 3, '4': 3, '5': 11, '6': '.ComicTagProto', '10': 'data'},
  ],
};

/// Descriptor for `RankTypeFilterResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rankTypeFilterResponseProtoDescriptor =
    $convert.base64Decode(
        'ChtSYW5rVHlwZUZpbHRlclJlc3BvbnNlUHJvdG8SFAoFZXJybm8YASABKAVSBWVycm5vEhYKBm'
        'Vycm1zZxgCIAEoCVIGZXJybXNnEiIKBGRhdGEYAyADKAsyDi5Db21pY1RhZ1Byb3RvUgRkYXRh');

@$core.Deprecated('Use comicUpdateListResponseProtoDescriptor instead')
const ComicUpdateListResponseProto$json = {
  '1': 'ComicUpdateListResponseProto',
  '2': [
    {'1': 'errno', '3': 1, '4': 1, '5': 5, '10': 'errno'},
    {'1': 'errmsg', '3': 2, '4': 1, '5': 9, '10': 'errmsg'},
    {
      '1': 'data',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ComicUpdateListInfoProto',
      '10': 'data'
    },
  ],
};

/// Descriptor for `ComicUpdateListResponseProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicUpdateListResponseProtoDescriptor =
    $convert.base64Decode(
        'ChxDb21pY1VwZGF0ZUxpc3RSZXNwb25zZVByb3RvEhQKBWVycm5vGAEgASgFUgVlcnJubxIWCg'
        'ZlcnJtc2cYAiABKAlSBmVycm1zZxItCgRkYXRhGAMgAygLMhkuQ29taWNVcGRhdGVMaXN0SW5m'
        'b1Byb3RvUgRkYXRh');

@$core.Deprecated('Use comicUpdateListInfoProtoDescriptor instead')
const ComicUpdateListInfoProto$json = {
  '1': 'ComicUpdateListInfoProto',
  '2': [
    {'1': 'comicId', '3': 1, '4': 1, '5': 3, '10': 'comicId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'islong', '3': 3, '4': 1, '5': 5, '10': 'islong'},
    {'1': 'authors', '3': 4, '4': 1, '5': 9, '10': 'authors'},
    {'1': 'types', '3': 5, '4': 1, '5': 9, '10': 'types'},
    {'1': 'cover', '3': 6, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'lastUpdateChapterName',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'lastUpdateChapterName'
    },
    {
      '1': 'lastUpdateChapterId',
      '3': 9,
      '4': 1,
      '5': 3,
      '10': 'lastUpdateChapterId'
    },
    {'1': 'lastUpdatetime', '3': 10, '4': 1, '5': 3, '10': 'lastUpdatetime'},
  ],
};

/// Descriptor for `ComicUpdateListInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comicUpdateListInfoProtoDescriptor = $convert.base64Decode(
    'ChhDb21pY1VwZGF0ZUxpc3RJbmZvUHJvdG8SGAoHY29taWNJZBgBIAEoA1IHY29taWNJZBIUCg'
    'V0aXRsZRgCIAEoCVIFdGl0bGUSFgoGaXNsb25nGAMgASgFUgZpc2xvbmcSGAoHYXV0aG9ycxgE'
    'IAEoCVIHYXV0aG9ycxIUCgV0eXBlcxgFIAEoCVIFdHlwZXMSFAoFY292ZXIYBiABKAlSBWNvdm'
    'VyEhYKBnN0YXR1cxgHIAEoCVIGc3RhdHVzEjQKFWxhc3RVcGRhdGVDaGFwdGVyTmFtZRgIIAEo'
    'CVIVbGFzdFVwZGF0ZUNoYXB0ZXJOYW1lEjAKE2xhc3RVcGRhdGVDaGFwdGVySWQYCSABKANSE2'
    'xhc3RVcGRhdGVDaGFwdGVySWQSJgoObGFzdFVwZGF0ZXRpbWUYCiABKANSDmxhc3RVcGRhdGV0'
    'aW1l');
