# Flutter Wordpress

This library uses [WordPress REST API V2](https://developer.wordpress.org/rest-api/) to provide a way for your application to interact with your WordPress website.

## Requirements
For authentication and usage of administrator level REST APIs, you need to use either of the two popular authentication plugins in your WordPress site:
1. [Application Passwords](https://wordpress.org/plugins/application-passwords/)
2. [JWT Authentication for WP REST API](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/)

## Getting Started

### 1. Import library

```dart
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
```

### 2. Instantiate WordPress class

```dart
wp.WordPress wordPress;

// adminName and adminKey is needed only for admin level APIs
wordPress = wp.WordPress(
    baseUrl: 'http://localhost',
    authenticator: wp.WordPressAuthenticator.ApplicationPasswords,
    adminName: '', 
    adminKey: '',
);
```

### 3. Authenticate User

```dart
Future<wp.User> response = wordPress.authenticateUser(
      username: 'username',
      password: 'password',
    );

response.then((user) {
    print(user.toString());
}).catchError((err) {
    print(err.toString());
});
```

### 4. Fetch Posts

```dart
Future<List<wp.Post>> posts = wordPress.fetchPosts(
      params: wp.ParamsPostList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 20,
        order: wp.Order.desc,
        orderBy: wp.PostsOrderBy.date,
      ),
    );
```

### 5. Fetch Users

```dart
Future<List<wp.User>> users = wordPress.fetchUsers(
      params: wp.ParamsUserList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 30,
        order: wp.Order.asc,
        orderBy: wp.UsersOrderBy.name,
        role: wp.UserRole.subscriber,
      ),
    );
```

### 6. Fetch Comments

```dart
Future<List<wp.Comment>> comments = wordPress.fetchComments(
      params: wp.ParamsCommentList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 30,
        includePostIDs: [1],
      ),
    );
```

## Future Work
1. Implementing OAuth 2.0 authentication.



