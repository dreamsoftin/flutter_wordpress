import 'package:flutter_wordpress/constants.dart';

/// This class holds all arguments which can be used to filter media when using
/// [WordPress.fetchMediaList] method.
///
/// [List Media Arguments](https://developer.wordpress.org/rest-api/reference/media/#list-media)
class ParamsMediaList {
  final WordPressContext context;
  final int pageNum;
  final int perPage;
  final String searchQuery;
  final String afterDate;
  final List<int> includeAuthorIDs;
  final List<int> excludeAuthorIDs;
  final String beforeDate;
  final List<int> excludeMediaIDs;
  final List<int> includeMediaIDs;
  final int? offset;
  final Order order;
  final MediaOrderBy orderBy;
  final List<int> includeParentIDs;
  final List<int> excludeParentIDs;
  final String slug;
  final MediaStatus mediaStatus;
  final MediaType? mediaType;
  final String mimeType;

  ParamsMediaList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    this.afterDate = '',
    this.includeAuthorIDs = const [],
    this.excludeAuthorIDs = const [],
    this.beforeDate = '',
    this.excludeMediaIDs = const [],
    this.includeMediaIDs = const [],
    this.offset,
    this.order = Order.desc,
    this.orderBy = MediaOrderBy.date,
    this.excludeParentIDs = const [],
    this.includeParentIDs = const [],
    this.slug = '',
    this.mediaStatus = MediaStatus.inherit,
    this.mediaType,
    this.mimeType = '',
  });

  Map<String, String> toMap() {
    return {
      'context': '${enumStringToName(this.context.toString())}',
      'page': '${this.pageNum}',
      'per_page': '${this.perPage}',
      'search': '${this.searchQuery}',
      'after': '${this.afterDate}',
      'author': '${listToUrlString(this.includeAuthorIDs)}',
      'author_exclude': '${listToUrlString(this.excludeAuthorIDs)}',
      'before': '${this.beforeDate}',
      'exclude': '${listToUrlString(excludeMediaIDs)}',
      'include': '${listToUrlString(includeMediaIDs)}',
      'offset': '${this.offset == null ? '' : this.offset}',
      'order': '${enumStringToName(this.order.toString())}',
      'orderby': '${enumStringToName(this.orderBy.toString())}',
      'parent': '${listToUrlString(includeParentIDs)}',
      'parent_exclude': '${listToUrlString(excludeParentIDs)}',
      'slug': '${this.slug}',
      'status': '${enumStringToName(this.mediaStatus.toString())}',
      'media_type':
          '${this.mediaType == null ? '' : enumStringToName(this.mediaType.toString())}',
      'mime_type': '${this.mimeType}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }
}
