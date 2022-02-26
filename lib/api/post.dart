import 'package:flutter_wordpress/api/crud_api.dart';
import 'package:flutter_wordpress/api/wp_api.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';

import '../requests/delete/base_delete_param.dart';

class PostAPI extends WPApi with CRUDHelper<Post,Post, ParamsPostList,DeleteParams> {
  PostAPI(String baseUrl, Map<String, dynamic> headers)
      : super(baseUrl, headers);

  @override
  Post decode(data) {
    return Post.fromJson(data);
  }

  @override
  String get path => URL_POSTS;

  @override
  Map<String, dynamic> paramtoJson(ParamsPostList data) {
    return data.toMap();
  }

  @override
  Map<String, dynamic> toJson(Post data) {
    return data.toJson();
  }
}
