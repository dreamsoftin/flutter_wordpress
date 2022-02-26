import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress_example/service/wordpress_service.dart';

class CommentsService {
  static CommentsService instance = CommentsService._();
  CommentsService._();

  Future<List<Comment>> getCommentss(int pageNo, int pageSize) {
    return WordPressService.instane.wordPress.comments.fetch(
      params: ParamsCommentList(
        pageNum: pageNo,
        perPage: pageSize,
      ),
    );
  }


  Future<Comment> create(Comment comments) {
    return WordPressService.instane.wordPress.comments.create(
     data: comments,
    );
  }
  Future<Comment> update(int commentsId,Comment comments) {
    return WordPressService.instane.wordPress.comments.create(
     data: comments,
    );
  }

  Future<void> delete(int commentsId)  async{
    return WordPressService.instane.wordPress.comments.delete(
     params: DeleteParams(
       id: commentsId
     )
    );
  }

  Future<List<CommentHierarchy>> fetchCommentsAsHierarchy({required ParamsCommentList params}) {
      return WordPressService.instane.wordPress.comments.fetchWithHierarchy(params: params);
  }


}
