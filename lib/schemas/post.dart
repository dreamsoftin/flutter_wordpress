import 'package:flutter_wordpress/constants.dart';
import 'package:meta/meta.dart';
import 'links.dart';
import 'content.dart';
import 'guid.dart';
import 'title.dart';
import 'excerpt.dart';

import 'user.dart';
import 'comment.dart';
import 'comment_hierarchy.dart';
import 'category.dart';
import 'tag.dart';
import 'media.dart';

/// A [WordPress Post](https://developer.wordpress.org/rest-api/reference/posts/)
///
/// Refer the above link to see which arguments are set based on different context modes.
/// ([WordPressContext]).
class Post {
  /// ID of the post
  int id;

  /// The date the post was published, in the site's Timezone.
  String date;

  /// The date the post was published, in GMT.
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;

  /// Password for the post in case it needs to be password protected.
  String password;

  /// An alphanumeric identifier unique to each post.
  String slug;

  /// The state in which the post should be created (draft, publish etc.)
  PostPageStatus status;
  String type;
  String link;

  /// Post title
  Title title;

  /// Post content
  Content content;

  /// Post excerpt
  Excerpt excerpt;

  /// ID of the post author. Refer [User].
  int authorID;

  int featuredMediaID;

  /// Whether the post allows commenting.
  PostCommentStatus commentStatus;

  /// Whether the post can be pinged.
  PostPingStatus pingStatus;

  /// Whether the post needs to sticky i.e. a Featured post.
  bool sticky;
  String template;

  /// The format of the post.
  PostFormat format;

  /// List of IDs of categories this post belongs to.
  List<int> categoryIDs;

  /// List of IDs of tags this post should have.
  List<int> tagIDs;
  String permalinkTemplate;
  String generatedSlug;
  Links lLinks;

  /// The [User] object denoting the author of the post.
  User author;

  /// A list of comments for the post.
  List<Comment> comments;

  /// A list of comments for the post, where each
  /// [CommentHierarchy] object is a direct comment to the post, with
  /// [CommentHierarchy.children] containing replies to that comment.
  List<CommentHierarchy> commentsHierarchy;

  /// A list of categories assigned to the post.
  List<Category> categories;

  /// A list of tags assigned to the post.
  List<Tag> tags;

  /// A list of attachments contained in the post.
  List<Media> attachments;

  /// The featured Media of the post.
  Media featuredMedia;

  Post({
    this.date,
    this.dateGmt,
    this.password,
    this.slug,
    this.status = PostPageStatus.publish,
    @required String title,
    @required String content,
    @required String excerpt,
    @required this.authorID,
    String featureMedia,
    this.featuredMediaID,
    this.commentStatus = PostCommentStatus.open,
    this.pingStatus = PostPingStatus.open,
    this.sticky,
    this.template,
    this.format = PostFormat.standard,
    this.categoryIDs,
    this.tagIDs,
  })  : this.title = new Title(rendered: title),
        this.featuredMedia = new Media(sourceUrl: featureMedia),
        this.content = new Content(rendered: content),
        this.excerpt = new Excerpt(rendered: excerpt);

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    password = json['password'];
    slug = json['slug'];
    if (json['status'] != null) {
      PostPageStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['status']) {
          status = val;
          return;
        }
      });
    }
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    excerpt =
        json['excerpt'] != null ? new Excerpt.fromJson(json['excerpt']) : null;
    authorID = json['author'];
    featuredMediaID = json['featured_media'];
    if (json['comment_status'] != null) {
      PostCommentStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['comment_status']) {
          commentStatus = val;
          return;
        }
      });
    }
    if (json['ping_status'] != null) {
      PostPingStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['ping_status']) {
          pingStatus = val;
          return;
        }
      });
    }
    sticky = json['sticky'];
    template = json['template'];
    if (json['format'] != null) {
      PostFormat.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['format']) {
          format = val;
          return;
        }
      });
    }
    categoryIDs = json['categories'] != null ? json['categories'].cast<int>() : null;
    tagIDs = json['tags'] != null ? json['tags'].cast<int>() : null;
    permalinkTemplate = json['permalink_template'];
    generatedSlug = json['generated_slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) data['date'] = this.date;
    if (this.dateGmt != null) data['date_gmt'] = this.dateGmt;
    if (this.password != null) data['password'] = this.password;
    if (this.slug != null) data['slug'] = this.slug;
    if (this.status != null)
      data['status'] = enumStringToName(this.status.toString());
    if (this.title != null) data['title'] = this.title.rendered;
    if (this.content != null) data['content'] = this.content.rendered;
    if (this.excerpt != null) data['excerpt'] = this.excerpt.rendered;
    if (this.authorID != null) data['author'] = this.authorID.toString();
    if (this.featuredMediaID != null)
      data['featured_media'] = this.featuredMediaID.toString();
    if (this.commentStatus != null)
      data['comment_status'] = enumStringToName(this.commentStatus.toString());
    if (this.pingStatus != null)
      data['ping_status'] = enumStringToName(this.pingStatus.toString());
    if (this.sticky != null) data['sticky'] = this.sticky.toString();
    if (this.template != null) data['template'] = this.template;
    if (this.format != null)
      data['format'] = enumStringToName(this.format.toString());
    if (this.categoryIDs != null)
      data['categories'] = listToUrlString(this.categoryIDs);
    if (this.tagIDs != null) data['tags'] = listToUrlString(this.tagIDs);
    return data;
  }

  @override
  String toString() {
    return 'Post: { id: $id, title: ${title.rendered}, '
        'author: {id: $authorID, name: ${author.name}}}';
  }
}
