import 'package:flutter_wordpress/flutter_wordpress.dart';

import '../requests/delete/base_delete_param.dart';
import 'crud_api.dart';
import 'wp_api.dart';

class CommentsAPI extends WPApi with CRUDHelper<Comment,Comment ,ParamsCommentList,DeleteParams> {
  // final DataSanitizerUtil _sanitizerUtil = const DataSanitizerUtil();

  CommentsAPI(String baseUrl, Map<String, dynamic> headers)
      : super(baseUrl, headers);

  Comment decode(data) {
    return Comment.fromJson(data);
  }

  @override
  String get path => URL_COMMENTS;

  @override
  Map<String, dynamic> paramtoJson(ParamsCommentList data) {
    return data.toMap();
  }

  @override
  Map<String, dynamic> toJson(Comment data) {
    return data.toJson();
  }

  ///
  /// To Fetch All Comments With Hierarchy
  ///
  Future<List<CommentHierarchy>> fetchWithHierarchy({
    required ParamsCommentList params,
  }) async {
    final List<Comment> comments = await fetch(params: params);
    List<CommentHierarchy> commentsHierarchy = [];

    for (var comment in comments) {
      if (comment.parent == 0)
        commentsHierarchy.add(_commentHierarchyBuilder(comments, comment));
    }
    return commentsHierarchy;
  }

  ///This recursive function builds the hierarchy of comments for the given post
  ///and comment. Only parent comments (direct comments to post) need to be
  ///supplied.
  CommentHierarchy _commentHierarchyBuilder(
    List<Comment> commentList,
    Comment comment,
  ) {
    final childComments = commentList.where((ele) =>
        ele.id != comment.id && ele.parent != 0 && ele.parent == comment.id);

    if (childComments.length == 0) {
      return new CommentHierarchy(comment: comment);
    } else {
      List<CommentHierarchy> children = [];
      childComments.forEach((c) {
        children.add(_commentHierarchyBuilder(commentList, c));
      });
      return new CommentHierarchy(
        comment: comment,
        children: children,
      );
    }
  }
}
