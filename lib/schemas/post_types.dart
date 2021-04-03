import 'capabilities.dart';
import 'labels.dart';
import 'links.dart';

class PostTypes {
  PostTypePost? post;
  PostTypePage? page;
  Attachment? attachment;
  WpBlock? wpBlock;

  PostTypes({
    this.post,
    this.page,
    this.attachment,
    this.wpBlock,
  });

  PostTypes.fromJson(Map<String, dynamic> json) {
    post =
        json['post'] != null ? new PostTypePost.fromJson(json['post']) : null;
    page =
        json['page'] != null ? new PostTypePage.fromJson(json['page']) : null;
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
    wpBlock = json['wp_block'] != null
        ? new WpBlock.fromJson(json['wp_block'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['post'] = this.post?.toJson();
    data['page'] = this.page?.toJson();
    data['attachment'] = this.attachment?.toJson();
    data['wp_block'] = this.wpBlock?.toJson();

    return data;
  }
}

class PostTypePost {
  Capabilities? capabilities;
  String? description;
  bool? hierarchical;
  bool? viewable;
  Labels? labels;
  String? name;
  String? slug;
  Supports? supports;
  List<String>? taxonomies;
  String? restBase;
  Links? lLinks;

  PostTypePost({
    this.capabilities,
    this.description,
    this.hierarchical,
    this.viewable,
    this.labels,
    this.name,
    this.slug,
    this.supports,
    this.taxonomies,
    this.restBase,
    this.lLinks,
  });

  PostTypePost.fromJson(Map<String, dynamic> json) {
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    description = json['description'];
    hierarchical = json['hierarchical'];
    viewable = json['viewable'];
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
    name = json['name'];
    slug = json['slug'];
    supports = json['supports'] != null
        ? new Supports.fromJson(json['supports'])
        : null;
    taxonomies = json['taxonomies'].cast<String>();
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['capabilities'] = this.capabilities?.toJson();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['viewable'] = this.viewable;
    data['labels'] = this.labels?.toJson();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['supports'] = this.supports?.toJson();
    data['taxonomies'] = this.taxonomies;
    data['rest_base'] = this.restBase;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Supports {
  bool? title;
  bool? editor;
  bool? author;
  bool? thumbnail;
  bool? excerpt;
  bool? trackbacks;
  bool? customFields;
  bool? comments;
  bool? revisions;
  bool? postFormats;

  Supports({
    this.title,
    this.editor,
    this.author,
    this.thumbnail,
    this.excerpt,
    this.trackbacks,
    this.customFields,
    this.comments,
    this.revisions,
    this.postFormats,
  });

  Supports.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    editor = json['editor'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    excerpt = json['excerpt'];
    trackbacks = json['trackbacks'];
    customFields = json['custom-fields'];
    comments = json['comments'];
    revisions = json['revisions'];
    postFormats = json['post-formats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['editor'] = this.editor;
    data['author'] = this.author;
    data['thumbnail'] = this.thumbnail;
    data['excerpt'] = this.excerpt;
    data['trackbacks'] = this.trackbacks;
    data['custom-fields'] = this.customFields;
    data['comments'] = this.comments;
    data['revisions'] = this.revisions;
    data['post-formats'] = this.postFormats;

    return data;
  }
}

class PostTypePage {
  Capabilities? capabilities;
  String? description;
  bool? hierarchical;
  bool? viewable;
  Labels? labels;
  String? name;
  String? slug;
  Supports? supports;
  List<int>? taxonomies;
  String? restBase;
  Links? lLinks;

  PostTypePage({
    this.capabilities,
    this.description,
    this.hierarchical,
    this.viewable,
    this.labels,
    this.name,
    this.slug,
    this.supports,
    this.taxonomies,
    this.restBase,
    this.lLinks,
  });

  PostTypePage.fromJson(Map<String, dynamic> json) {
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    description = json['description'];
    hierarchical = json['hierarchical'];
    viewable = json['viewable'];
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
    name = json['name'];
    slug = json['slug'];
    supports = json['supports'] != null
        ? new Supports.fromJson(json['supports'])
        : null;
    taxonomies = json['taxonomies'].cast<int>();
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['capabilities'] = this.capabilities?.toJson();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['viewable'] = this.viewable;
    data['labels'] = this.labels?.toJson();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['supports'] = this.supports?.toJson();
    data['taxonomies'] = this.taxonomies;
    data['rest_base'] = this.restBase;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Attachment {
  Capabilities? capabilities;
  String? description;
  bool? hierarchical;
  bool? viewable;
  Labels? labels;
  String? name;
  String? slug;
  Supports? supports;
  List<int>? taxonomies;
  String? restBase;
  Links? lLinks;

  Attachment({
    this.capabilities,
    this.description,
    this.hierarchical,
    this.viewable,
    this.labels,
    this.name,
    this.slug,
    this.supports,
    this.taxonomies,
    this.restBase,
    this.lLinks,
  });

  Attachment.fromJson(Map<String, dynamic> json) {
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    description = json['description'];
    hierarchical = json['hierarchical'];
    viewable = json['viewable'];
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
    name = json['name'];
    slug = json['slug'];
    supports = json['supports'] != null
        ? new Supports.fromJson(json['supports'])
        : null;
    taxonomies = json['taxonomies'].cast<int>();
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['capabilities'] = this.capabilities?.toJson();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['viewable'] = this.viewable;
    data['labels'] = this.labels?.toJson();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['supports'] = this.supports?.toJson();
    data['taxonomies'] = this.taxonomies;
    data['rest_base'] = this.restBase;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class WpBlock {
  Capabilities? capabilities;
  String? description;
  bool? hierarchical;
  bool? viewable;
  Labels? labels;
  String? name;
  String? slug;
  Supports? supports;
  List<int>? taxonomies;
  String? restBase;
  Links? lLinks;

  WpBlock({
    this.capabilities,
    this.description,
    this.hierarchical,
    this.viewable,
    this.labels,
    this.name,
    this.slug,
    this.supports,
    this.taxonomies,
    this.restBase,
    this.lLinks,
  });

  WpBlock.fromJson(Map<String, dynamic> json) {
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    description = json['description'];
    hierarchical = json['hierarchical'];
    viewable = json['viewable'];
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
    name = json['name'];
    slug = json['slug'];
    supports = json['supports'] != null
        ? new Supports.fromJson(json['supports'])
        : null;
    taxonomies = json['taxonomies'].cast<int>();
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['capabilities'] = this.capabilities?.toJson();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['viewable'] = this.viewable;
    data['labels'] = this.labels?.toJson();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['supports'] = this.supports?.toJson();
    data['taxonomies'] = this.taxonomies;
    data['rest_base'] = this.restBase;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}
