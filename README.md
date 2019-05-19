# Flutter Wordpress

This library uses [WordPress REST API V2](https://developer.wordpress.org/rest-api/) to provide a way for your application to interact with your WordPress website.

## Screenshots
<img src='https://raw.githubusercontent.com/dreamsoftin/flutter_wordpress/master/example/images/screenshots/posts.png' height='400'>

## Requirements
For authentication and usage of administrator level REST APIs, you need to use either of the two popular authentication plugins in your WordPress site:
1. [Application Passwords](https://wordpress.org/plugins/application-passwords/)
2. [JWT Authentication for WP REST API](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/) <strong>(recommended)</strong>

## Getting Started

### 1. Import library

#### First:
Find your pubspec.yaml in the root of your project and add the flutter_wordpress: ^0.1.4 under cupertino_icons: ^0.1.2

#### Second:
```dart
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
```

### 2. Instantiate WordPress class

```dart
wp.WordPress wordPress;

// adminName and adminKey is needed only for admin level APIs
wordPress = wp.WordPress(
  baseUrl: 'http://localhost',
  authenticator: wp.WordPressAuthenticator.JWT,
  adminName: '', 
  adminKey: '',
);
```

### 3. Authenticate User

```dart
Future<wp.User> response = wordPress.authenticateUser(
  username: 'ChiefEditor',
  password: 'chiefeditor@123',
);

response.then((user) {
  createPost(user);
}).catchError((err) {
  print('Failed to fetch user: $err');
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
  fetchAuthor: true,
  fetchFeaturedMedia: true,
  fetchComments: true,
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
### 7. Create Post

```dart
void createPost(wp.User user) {
  final post = wordPress.createPost(
    post: new wp.Post(
      title: 'First post as a Chief Editor',
      content: 'Blah! blah! blah!',
      excerpt: 'Discussion about blah!',
      author: user.id,
      commentStatus: wp.PostCommentStatus.open,
      pingStatus: wp.PostPingStatus.closed,
      status: wp.PostPageStatus.publish,
      format: wp.PostFormat.standard,
      sticky: true,
    ),
  );

  post.then((p) {
    print('Post created successfully with ID: ${p.id}');
    postComment(user, p);
  }).catchError((err) {
    print('Failed to create post: $err');
  });
}
```
### 8. Post Comment

```dart
void postComment(wp.User user, wp.Post post) {
  final comment = wordPress.createComment(
    comment: new wp.Comment(
      author: user.id,
      post: post.id,
      content: "First!",
      parent: 0,
    ),
  );

  comment.then((c) {
    print('Comment successfully posted with ID: ${c.id}');
  }).catchError((err) {
    print('Failed to comment: $err');
  });
}
```

## Future Work
1. Implementing OAuth 2.0 authentication.
