import 'package:flutter_wordpress/constants.dart';

/// This class holds all arguments which can be used to filter pages when using
/// [WordPress.fetchPages] method.
///
/// [List Pages' Arguments](https://developer.wordpress.org/rest-api/reference/pages/#list-pages)
class ParamsPageList {
  final WordPressContext context;
  final int pageNum;
  final int perPage;
  final String searchQuery;
  final String afterDate;
  final List<int> includeAuthorIDs;
  final List<int> excludeAuthorIDs;
  final String beforeDate;
  final List<int> excludePageIDs;
  final List<int> includePageIDs;
  final int? menuOrder;
  final int? offset;
  final Order order;
  final PageOrderBy orderBy;
  final List<int> includeParentIDs;
  final List<int> excludeParentIDs;
  final String slug;
  final PostPageStatus pageStatus;

  ParamsPageList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    this.afterDate = '',
    this.includeAuthorIDs = const [],
    this.excludeAuthorIDs = const [],
    this.beforeDate = '',
    this.excludePageIDs = const [],
    this.includePageIDs = const [],
    this.menuOrder,
    this.offset,
    this.order = Order.desc,
    this.orderBy = PageOrderBy.date,
    this.includeParentIDs = const [],
    this.excludeParentIDs = const [],
    this.slug = '',
    this.pageStatus = PostPageStatus.publish,
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
      'exclude': '${listToUrlString(excludePageIDs)}',
      'include': '${listToUrlString(includePageIDs)}',
      'menu_order': '${this.menuOrder == null ? '' : this.menuOrder}',
      'offset': '${this.offset == null ? '' : this.offset}',
      'order': '${enumStringToName(this.order.toString())}',
      'orderby': '${enumStringToName(this.orderBy.toString())}',
      'parent': '${listToUrlString(includeParentIDs)}',
      'parent_exclude': '${listToUrlString(excludeParentIDs)}',
      'slug': '${this.slug}',
      'status': '${enumStringToName(this.pageStatus.toString())}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }
}
