import 'dart:async' as async;
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'schemas/jwt_response.dart';
import 'schemas/avatar_urls.dart';
import 'schemas/capabilities.dart';
import 'schemas/category.dart';
import 'schemas/comment.dart';
import 'schemas/content.dart';
import 'schemas/excerpt.dart';
import 'schemas/guid.dart';
import 'schemas/labels.dart';
import 'schemas/links.dart';
import 'schemas/media.dart';
import 'schemas/page.dart';
import 'schemas/post_statuses.dart';
import 'schemas/post_types.dart';
import 'schemas/post.dart';
import 'schemas/settings.dart';
import 'schemas/tag.dart';
import 'schemas/taxonomies.dart';
import 'schemas/title.dart';
import 'schemas/user.dart';
import 'schemas/wordpress_error.dart';

import 'constants.dart';

import 'requests/params_post_list.dart';

export 'schemas/jwt_response.dart';
export 'schemas/avatar_urls.dart';
export 'schemas/capabilities.dart';
export 'schemas/category.dart';
export 'schemas/comment.dart';
export 'schemas/content.dart';
export 'schemas/excerpt.dart';
export 'schemas/guid.dart';
export 'schemas/labels.dart';
export 'schemas/links.dart';
export 'schemas/media.dart';
export 'schemas/page.dart';
export 'schemas/post_statuses.dart';
export 'schemas/post_types.dart';
export 'schemas/post.dart';
export 'schemas/settings.dart';
export 'schemas/tag.dart';
export 'schemas/taxonomies.dart';
export 'schemas/title.dart';
export 'schemas/user.dart';
export 'schemas/wordpress_error.dart';

export 'constants.dart';

export 'requests/params_post_list.dart';

class WordPress {
  String _baseUrl;
  WordPressAuthenticator _authenticator;

  Map<String, String> _urlHeader = {
    'Authorization': '',
  };

  /// Take in base url and remove trailing '/' from the url if it exists.
  /// Take in the wordpress context and get the enum name.
  WordPress(
      {@required String baseUrl,
      WordPressAuthenticator authenticator,
      String adminName,
      String adminKey}) {
    this._baseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;

    this._authenticator = authenticator;

    if (adminName != null && adminKey != null && this._authenticator != null) {
      switch (this._authenticator) {
        case WordPressAuthenticator.ApplicationPasswords:
          String str = '$adminName:$adminKey';
          String base64 = base64Encode(utf8.encode(str));
          _urlHeader['Authorization'] = 'Basic $base64';
          break;
        case WordPressAuthenticator.JWT:
          //TODO: Implement JWT Admin authentication
          break;
      }
    }
  }

  async.Future<User> authenticateUser(
      {@required username, @required password}) async {
    if (_authenticator == WordPressAuthenticator.ApplicationPasswords) {
      return _authenticateViaAP(username, password);
    } else if (_authenticator == WordPressAuthenticator.JWT) {
      return _authenticateViaJWT(username, password);
    } else
      return fetchUser(username: username);
  }

  async.Future<User> _authenticateViaAP(username, password) async {
    //TODO: Implement Application Passwords User Authentication
    return fetchUser(username: username);
  }

  async.Future<User> _authenticateViaJWT(username, password) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      _baseUrl + URL_JWT_TOKEN,
      body: body,
    );

    if (response.statusCode == 200) {
      JWTResponse authResponse =
          JWTResponse.fromJson(json.decode(response.body));
      _urlHeader['Authorization'] = 'Bearer ${authResponse.token}';

      return fetchUser(email: authResponse.userEmail);
    } else {
      try {
        WordPressError err =
            WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordPressError(message: response.body);
      }
    }
  }

  async.Future<User> fetchUser({int id, String email, String username}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + URL_USERS);
    final Map<String, String> params = {
      'search': '',
    };
    if (id != null) {
      params['search'] = '$id';
    } else if (email != null)
      params['search'] = email;
    else if (username != null) params['search'] = username;

    url.write(constructUrlParams(params));

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode == 200) {
      final jsonStr = json.decode(response.body);
      if (jsonStr.length == 0)
        throw new WordPressError(
            code: 'wp_empty_list', message: "No users found");
      return User.fromJson(jsonStr[0]);
    } else {
      try {
        WordPressError err =
            WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordPressError(message: response.body);
      }
    }
  }

  async.Future<List<Post>> fetchPosts({@required ParamsPostList params}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + URL_POSTS);

    print(params.toString());
    print(params.toMap());

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode == 200) {
      List<Post> posts = new List<Post>();

      dynamic list = json.decode(response.body);
      list.forEach((post) {
        posts.add(Post.fromJson(post));
      });
      return posts;
    } else {
      try {
        WordPressError err =
            WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordPressError(message: response.body);
      }
    }
  }

  async.Future<List<User>> fetchUsers(
      {int pageNum = 1, int perPage = 10}) async {
    //TODO: Implement parameters
    final url = _baseUrl + URL_USERS + constructUrlParams(new Map());

    final response = await http.get(url, headers: _urlHeader);

    if (response.statusCode == 200) {
      List<User> users = new List();
      dynamic list = json.decode(response.body);
      list.forEach((user) {
        users.add(User.fromJson(user));
      });
      return users;
    } else {
      try {
        WordPressError err =
            WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordPressError(message: response.body);
      }
    }
  }

  async.Future<List<Comment>> fetchComments({Post post, int id}) async {
    //TODO: Implement parameters
    final StringBuffer url = new StringBuffer(_baseUrl + URL_COMMENTS);
    Map<String, String> params;
    if (post != null) ;

    final response = await http.get(url, headers: _urlHeader);

    if (response.statusCode == 200) {
      List<Comment> comments = new List();
      dynamic list = json.decode(response.body);
      list.forEach((comment) {
        comments.add(Comment.fromJson(comment));
      });
      return comments;
    } else {
      try {
        WordPressError err =
            WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new WordPressError(message: response.body);
      }
    }
  }
}
