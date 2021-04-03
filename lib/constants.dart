const URL_JWT_BASE = '/wp-json/jwt-auth/v1';
const URL_WP_BASE = '/wp-json/wp/v2';

const URL_JWT_TOKEN = '$URL_JWT_BASE/token';
const URL_JWT_TOKEN_VALIDATE = '$URL_JWT_BASE/token/validate';

const URL_CATEGORIES = '$URL_WP_BASE/categories';
const URL_COMMENTS = '$URL_WP_BASE/comments';
const URL_MEDIA = '$URL_WP_BASE/media';
const URL_PAGES = '$URL_WP_BASE/pages';
const URL_POSTS = '$URL_WP_BASE/posts';
const URL_TAGS = '$URL_WP_BASE/tags';
const URL_USERS = '$URL_WP_BASE/users';
const URL_USER_ME = '$URL_WP_BASE/users/me';

enum WordPressAuthenticator {
  JWT,
  ApplicationPasswords,
}
enum WordPressContext { view, embed, edit }

enum Order {
  asc,
  desc,
}

enum PostOrderBy {
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
enum PostPageStatus {
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
enum PostFormat {
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

enum UserOrderBy {
  id,
  include,
  name,
  registered_date,
  slug,
  email,
  url,
}

enum CommentOrderBy {
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
enum CommentType {
  comment,
  //TODO: Add all comment types
}

enum CategoryTagOrderBy {
  id,
  include,
  name,
  slug,
  term_group,
  description,
  count,
}

enum PageOrderBy {
  author,
  date,
  id,
  include,
  modified,
  parent,
  relevance,
  slug,
  title,
  menu_order,
}

enum MediaOrderBy {
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
enum MediaStatus {
  inherit,
  publish,
  future,
  draft,
  pending,
  private,
}
enum MediaType {
  image,
  video,
  audio,
  application,
}

/// Converts an enum string to enum value name.
String enumStringToName(String enumString) {
  return enumString.split('.')[1];
}

/// Formats a list of [items] to a comma(,) separated string to pass it as a
/// URL parameter.
String listToUrlString<T>(List<T> items) {
  if (items.length == 0) return '';

  return items.join(',');
}

/// Formats a [Map] of parameters to a string of URL friendly parameters.
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
