import 'package:flutter_wordpress/constants.dart';

/// This class holds all arguments which can be used to filter Tags when using
/// [WordPress.fetchTags] method.
///
/// [List Tags' Arguments](https://developer.wordpress.org/rest-api/reference/tags/#list-tags)
class ParamsTagList {
  final WordPressContext context;
  final int pageNum;
  final int perPage;
  final String searchQuery;
  final List<int> excludeTagIDs;
  final List<int> includeTagIDs;
  final Order order;
  final CategoryTagOrderBy orderBy;
  final bool? hideEmpty;
  final int? post;
  final String slug;

  ParamsTagList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    this.excludeTagIDs = const [],
    this.includeTagIDs = const [],
    this.order = Order.asc,
    this.orderBy = CategoryTagOrderBy.name,
    this.hideEmpty,
    this.post,
    this.slug = '',
  });

  Map<String, String> toMap() {
    return {
      'context': '${enumStringToName(this.context.toString())}',
      'page': '${this.pageNum}',
      'per_page': '${this.perPage}',
      'search': '${this.searchQuery}',
      'exclude': '${listToUrlString(this.excludeTagIDs)}',
      'include': '${listToUrlString(this.includeTagIDs)}',
      'order': '${enumStringToName(this.order.toString())}',
      'orderby': '${enumStringToName(this.orderBy.toString())}',
      'hide_empty': '${this.hideEmpty == null ? '' : this.hideEmpty}',
      'post': '${this.post == null ? '' : this.post}',
      'slug': '${this.slug}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }
}
