import 'package:flutter_wordpress/constants.dart';

/// This class holds all arguments which can be used to filter users when using
/// [WordPress.fetchUsers] method.
///
/// [List Users' Arguments](https://developer.wordpress.org/rest-api/reference/users/#list-users)
class ParamsUserList {
  final WordPressContext context;
  final int pageNum;
  final int perPage;
  final String searchQuery;
  final List<int> includeUserIDs;
  final List<int> excludeUserIDs;
  final int? offset;
  final Order order;
  final UserOrderBy orderBy;
  final String slug;
  final List<String> roles;

  ParamsUserList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    this.includeUserIDs = const [],
    this.excludeUserIDs = const [],
    this.offset,
    this.order = Order.asc,
    this.orderBy = UserOrderBy.name,
    this.slug = '',
    this.roles = const [],
  });

  Map<String, String> toMap() {
    return {
      'context': '${enumStringToName(this.context.toString())}',
      'page': '${this.pageNum}',
      'per_page': '${this.perPage}',
      'search': '${this.searchQuery}',
      'include': '${listToUrlString(this.includeUserIDs)}',
      'exclude': '${listToUrlString(this.excludeUserIDs)}',
      'offset': '${this.offset == null ? '' : this.offset}',
      'order': '${enumStringToName(this.order.toString())}',
      'orderby': '${enumStringToName(this.orderBy.toString())}',
      'slug': '${this.slug}',
      'roles': '${listToUrlString(this.roles)}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }
}
