import 'dart:async' as async;
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'schemas/auth_response.dart';
import 'schemas/avatar_urls.dart';
import 'schemas/capabilities.dart';
import 'schemas/categories.dart';
import 'schemas/comments.dart';
import 'schemas/content.dart';
import 'schemas/error.dart';
import 'schemas/excerpt.dart';
import 'schemas/guid.dart';
import 'schemas/labels.dart';
import 'schemas/links.dart';
import 'schemas/media.dart';
import 'schemas/pages.dart';
import 'schemas/post_statuses.dart';
import 'schemas/post_types.dart';
import 'schemas/posts.dart';
import 'schemas/settings.dart';
import 'schemas/tags.dart';
import 'schemas/taxonomies.dart';
import 'schemas/title.dart';
import 'schemas/users.dart';

export 'schemas/auth_response.dart';
export 'schemas/avatar_urls.dart';
export 'schemas/capabilities.dart';
export 'schemas/categories.dart';
export 'schemas/comments.dart';
export 'schemas/content.dart';
export 'schemas/error.dart';
export 'schemas/excerpt.dart';
export 'schemas/guid.dart';
export 'schemas/labels.dart';
export 'schemas/links.dart';
export 'schemas/media.dart';
export 'schemas/pages.dart';
export 'schemas/post_statuses.dart';
export 'schemas/post_types.dart';
export 'schemas/posts.dart';
export 'schemas/settings.dart';
export 'schemas/tags.dart';
export 'schemas/taxonomies.dart';
export 'schemas/title.dart';
export 'schemas/users.dart';

const URL_WP_BASE = '/wp-json/wp/v2';
const URL_JWT_BASE = '/wp-json/jwt-auth/v1';

const URL_JWT_TOKEN = '$URL_JWT_BASE/token';
const URL_JWT_TOKEN_VALIDATE = '$URL_JWT_BASE/token/validate';

const URL_POSTS = '$URL_WP_BASE/posts';
const URL_USERS = '$URL_WP_BASE/users';

enum WordpressContext { view, embed, edit }

class WordPress {
  final String _baseUrl;
  final String _wpContext;

  Map<String, String> _header = {
    'Authorization': 'Bearer ',
  };
  String _wpContextParam;

  /// Take in base url and remove trailing '/' from the url if it exists.
  /// Take in the wordpress context and get the enum name.
  WordPress(String baseUrl, WordpressContext wpContext)
      : assert(baseUrl != null),
        this._baseUrl = baseUrl.endsWith('/')
            ? baseUrl.substring(0, baseUrl.length - 1)
            : baseUrl,
        this._wpContext = wpContext.toString().split('.')[1] {
    _wpContextParam = '/?context=${this._wpContext}';
  }

  async.Future<AuthResponse> authenticateUser(
      {@required username, @required password}) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      _baseUrl + URL_JWT_TOKEN,
      body: body,
    );

    if (response.statusCode == 200) {
      AuthResponse authResponse =
          AuthResponse.fromJson(json.decode(response.body));
      _header['Authorization'] += authResponse.token;
      return authResponse;
    } else {
      try {
        WordpressError err =
            WordpressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordpressError(message: e.message);
      }
    }
  }

  async.Future<List<Posts>> fetchPosts() async {
    final url = _baseUrl + URL_POSTS + _wpContextParam;

    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      List<Posts> posts = new List();

      dynamic list = json.decode(response.body);
      list.forEach((post) {
        posts.add(Posts.fromJson(post));
      });
      return posts;
    } else {
      try {
        WordpressError err =
            WordpressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordpressError(message: e.message);
      }
    }
  }

  async.Future<List<Users>> fetchUsers() async {
    final url = _baseUrl + URL_USERS + _wpContextParam;

    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      List<Users> users = new List();
      dynamic list = json.decode(response.body);
      list.forEach((user) {
        users.add(Users.fromJson(user));
      });
      return users;
    } else {
      try {
        WordpressError err =
            WordpressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordpressError(message: e.message);
      }
    }
  }


}
