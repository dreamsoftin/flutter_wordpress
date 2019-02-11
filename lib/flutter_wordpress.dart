import 'dart:async';
import 'dart:convert';
import 'schemas/posts.dart';
import 'package:http/http.dart' as http;

export 'schemas/avatar_urls.dart';
export 'schemas/categories.dart';
export 'schemas/comments.dart';
export 'schemas/content.dart';
export 'schemas/excerpt.dart';
export 'schemas/guid.dart';
export 'schemas/links.dart';
export 'schemas/media.dart';
export 'schemas/pages.dart';
export 'schemas/post_statuses.dart';
export 'schemas/post_types.dart';
export 'schemas/posts.dart';
export 'schemas/tags.dart';
export 'schemas/taxonomies.dart';
export 'schemas/title.dart';
export 'schemas/users.dart';

class WordPressAPI {
  Future<List<Posts>> fetchPosts() async {
    final response =
        await http.get('http://demo.wp-api.org/wp-json/wp/v2/posts/');

    if (response.statusCode == 200) {
      List<Posts> posts = new List();

      dynamic list = json.decode(response.body);
      print('List lenght: ${list.length}');
      list.forEach((post) {
        posts.add(Posts.fromJson(post));
      });
      return posts;

    } else {
      throw Exception('Failed to load post');
    }
  }
}
