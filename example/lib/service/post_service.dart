import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress_example/service/wordpress_service.dart';

class PostService {
  static PostService instance = PostService._();
  PostService._();

  Future<List<Post>> getPosts(int pageNo, int pageSize) {
    return WordPressService.instane.wordPress.fetchPosts(
      postParams: ParamsPostList(
        pageNum: pageNo,
        perPage: pageSize,

      ),

    fetchAuthor: true,
    fetchCategories: true,
    fetchTags: true,
    fetchFeaturedMedia: true,
    );
  }


  Future<Post> create(Post post) {
    return WordPressService.instane.wordPress.post.create(
     data: post,
    );
  }
  Future<Post> update(int postId,Post post) {
    return WordPressService.instane.wordPress.post.create(
     data: post,
    );
  }

  Future<void> delete(int postId)  async{
    return WordPressService.instane.wordPress.post.delete(
     params: DeleteParams(
       id: postId
     )
    );
  }


}
