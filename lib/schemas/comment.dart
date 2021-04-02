import 'package:flutter_wordpress/constants.dart';

import 'avatar_urls.dart';
import 'content.dart';
import 'links.dart';

/// A [WordPress Comment](https://developer.wordpress.org/rest-api/reference/comments/)
///
/// Refer the above link to see which arguments are set based on different
/// context modes ([WordPressContext]).
class Comment {
  /// ID of the comment.
  int? id;

  /// ID of the post on which to comment.
  int? post;

  /// ID of the parent comment in case of reply.
  /// This should be 0 in case of a new comment.
  int? parent;

  /// ID of the author who is going to comment.
  int? author;
  String? authorName;
  String? authorEmail;
  String? authorUrl;
  String? authorIp;
  String? authorUserAgent;

  /// The date the comment was written, in the site's timezone.
  String? date;

  /// The date the comment was written, in GMT.
  String? dateGmt;

  /// Content of the comment.
  Content? content;
  String? link;

  /// This can only be set by an editor/administrator.
  CommentStatus? status;

  /// This can only be set by an editor/administrator.
  CommentType? type;
  AvatarUrls? authorAvatarUrls;
  Links? lLinks;

  Comment({
    required this.author,
    required this.post,
    required String content,
    this.authorEmail,
    this.authorIp,
    this.authorName,
    this.authorUrl,
    this.authorUserAgent,
    this.date,
    this.dateGmt,
    this.parent = 0,
    this.status,
  }) : content = new Content(rendered: content);

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    post = json['post'];
    parent = json['parent'];
    author = json['author'];
    authorName = json['author_name'];
    authorEmail = json['author_email'];
    authorUrl = json['author_url'];
    authorIp = json['author_ip'];
    authorUserAgent = json['author_user_agent'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    content = (json['content'] != null
        ? new Content.fromJson(json['content']!)
        : null)!;
    link = json['link'];
    if (json['status'] != null) {
      CommentStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['status']) {
          status = val;
          return;
        }
      });
    }
    if (json['type'] != null) {
      CommentType.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['type']) {
          type = val;
          return;
        }
      });
    }
    authorAvatarUrls = json['author_avatar_urls'] != null
        ? new AvatarUrls.fromJson(json['author_avatar_urls'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['post'] = this.post;
    data['parent'] = this.parent;
    data['author'] = this.author;
    data['author_name'] = this.authorName;
    data['author_email'] = this.authorEmail;
    data['author_url'] = this.authorUrl;
    data['author_ip'] = this.authorIp;
    data['author_user_agent'] = this.authorUserAgent;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    data['content'] = this.content?.toJson();
    data['status'] = enumStringToName(this.status.toString());

    return data;
  }

  @override
  String toString() {
    return 'Comment: {id: $id, author: $authorName, post: $post, parent: $parent}';
  }
}
