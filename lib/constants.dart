const URL_WP_BASE = '/wp-json/wp/v2';
const URL_JWT_BASE = '/wp-json/jwt-auth/v1';

const URL_JWT_TOKEN = '$URL_JWT_BASE/token';
const URL_JWT_TOKEN_VALIDATE = '$URL_JWT_BASE/token/validate';

const URL_POSTS = '$URL_WP_BASE/posts';
const URL_USERS = '$URL_WP_BASE/users';
const URL_COMMENTS = '$URL_WP_BASE/comments';

enum WordPressAuthenticator {
  JWT,
  ApplicationPasswords,
}
enum WordPressContext { view, embed, edit }

enum Order {
  asc,
  desc,
}

enum PostsOrderBy {
  author,
  date,
  id,
  include,
  modified,
  parent,
  relevance,
  slug,
  title,
}
enum PostStatus {
  publish,
  future,
  draft,
  pending,
  private,
}
enum PostCommentStatus {
  open,
  closed,
}
enum PostPingStatus {
  open,
  closed,
}
enum ObjectFormat {
  standard,
  aside,
  chat,
  gallery,
  link,
  image,
  quote,
  status,
  video,
  audio,
}

enum UsersOrderBy {
  id,
  include,
  name,
  registered_date,
  slug,
  email,
  url,
}
enum UserRole {
  subscriber,
  contributor,
  author,
  editor,
  administrator,
}

enum CommentsOrderBy {
  date,
  date_gmt,
  id,
  include,
  post,
  parent,
  type,
}
enum CommentStatus {
  all,
  approve,
  hold,
  spam,
  trash,
}

String enumStringToName(String enumString) {
  return enumString.split('.')[1];
}

String listToUrlString<T>(List<T> items) {
  if (items == null || items.length == 0) return '';

  return items.join(',');
}

String constructUrlParams(Map<String, String> params) {
  StringBuffer p = new StringBuffer('/?');
  params.forEach((key, value) {
    if (value != '') {
      p.write('$key=$value');
      p.write('&');
    }
  });
  return p.toString();
}
