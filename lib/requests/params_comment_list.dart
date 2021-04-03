import 'package:flutter_wordpress/constants.dart';

/// This class holds all arguments which can be used to filter comments when using
/// [WordPress.fetchComments] method.
///
/// [List Comments' Arguments](https://developer.wordpress.org/rest-api/reference/comments/#list-comments)
class ParamsCommentList {
  final WordPressContext context;
  final int pageNum;
  final int perPage;
  final String searchQuery;
  final String afterDate;
  final List<int> includeAuthorIDs;
  final List<int> excludeAuthorIDs;
  final String authorEmail;
  final String beforeDate;
  final List<int> excludeCommentIDs;
  final List<int> includeCommentIDs;
  final int? offset;
  final Order order;
  final CommentOrderBy orderBy;
  final List<int> includeParentIDs;
  final List<int> excludeParentIDs;
  final List<int> includePostIDs;
  final CommentStatus commentStatus;
  final CommentType commentType;
  final String postPassword;

  ParamsCommentList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    this.afterDate = '',
    this.includeAuthorIDs = const [],
    this.excludeAuthorIDs = const [],
    this.authorEmail = '',
    this.beforeDate = '',
    this.excludeCommentIDs = const [],
    this.includeCommentIDs = const [],
    this.offset,
    this.order = Order.desc,
    this.orderBy = CommentOrderBy.date_gmt,
    this.includeParentIDs = const [],
    this.excludeParentIDs = const [],
    this.includePostIDs = const [],
    this.commentStatus = CommentStatus.approve,
    this.commentType = CommentType.comment,
    this.postPassword = '',
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
      'author_email': '${this.authorEmail}',
      'before': '${this.beforeDate}',
      'exclude': '${listToUrlString(excludeCommentIDs)}',
      'include': '${listToUrlString(includeCommentIDs)}',
      'offset': '${this.offset == null ? '' : this.offset}',
      'order': '${enumStringToName(this.order.toString())}',
      'orderby': '${enumStringToName(this.orderBy.toString())}',
      'parent': '${listToUrlString(this.includeParentIDs)}',
      'parent_exclude': '${listToUrlString(this.excludeParentIDs)}',
      'post': '${listToUrlString(this.includePostIDs)}',
      'status': '${enumStringToName(this.commentStatus.toString())}',
      'type': '${enumStringToName(this.commentType.toString())}',
      'password': '${this.postPassword}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }
}
