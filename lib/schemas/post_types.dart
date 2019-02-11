import 'links.dart';

class PostTypes {
  Post post;
  Page page;
  Attachment attachment;
  WpBlock wpBlock;

  PostTypes({this.post, this.page, this.attachment, this.wpBlock});

  PostTypes.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
    wpBlock = json['wp_block'] != null
        ? new WpBlock.fromJson(json['wp_block'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post.toJson();
    }
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    if (this.attachment != null) {
      data['attachment'] = this.attachment.toJson();
    }
    if (this.wpBlock != null) {
      data['wp_block'] = this.wpBlock.toJson();
    }
    return data;
  }
}

class Post {
  String description;
  bool hierarchical;
  String name;
  String slug;
  List<String> taxonomies;
  String restBase;
  Links lLinks;

  Post(
      {this.description,
        this.hierarchical,
        this.name,
        this.slug,
        this.taxonomies,
        this.restBase,
        this.lLinks});

  Post.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    hierarchical = json['hierarchical'];
    name = json['name'];
    slug = json['slug'];
    taxonomies = json['taxonomies'].cast<String>();
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['taxonomies'] = this.taxonomies;
    data['rest_base'] = this.restBase;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Page {
  String description;
  bool hierarchical;
  String name;
  String slug;
  List<Null> taxonomies;
  String restBase;
  Links lLinks;

  Page(
      {this.description,
        this.hierarchical,
        this.name,
        this.slug,
        this.taxonomies,
        this.restBase,
        this.lLinks});

  Page.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    hierarchical = json['hierarchical'];
    name = json['name'];
    slug = json['slug'];
    /*if (json['taxonomies'] != null) {
      taxonomies = new List<>();
      json['taxonomies'].forEach((v) {
        taxonomies.add(new Null.fromJson(v));
      });
    }*/
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['name'] = this.name;
    data['slug'] = this.slug;
    /*if (this.taxonomies != null) {
      data['taxonomies'] = this.taxonomies.map((v) => v.toJson()).toList();
    }*/
    data['rest_base'] = this.restBase;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Attachment {
  String description;
  bool hierarchical;
  String name;
  String slug;
  List<Null> taxonomies;
  String restBase;
  Links lLinks;

  Attachment(
      {this.description,
        this.hierarchical,
        this.name,
        this.slug,
        this.taxonomies,
        this.restBase,
        this.lLinks});

  Attachment.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    hierarchical = json['hierarchical'];
    name = json['name'];
    slug = json['slug'];
    /*if (json['taxonomies'] != null) {
      taxonomies = new List<Null>();
      json['taxonomies'].forEach((v) {
        taxonomies.add(new Null.fromJson(v));
      });
    }*/
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['name'] = this.name;
    data['slug'] = this.slug;
    /*if (this.taxonomies != null) {
      data['taxonomies'] = this.taxonomies.map((v) => v.toJson()).toList();
    }*/
    data['rest_base'] = this.restBase;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class WpBlock {
  String description;
  bool hierarchical;
  String name;
  String slug;
  List<Null> taxonomies;
  String restBase;
  Links lLinks;

  WpBlock(
      {this.description,
        this.hierarchical,
        this.name,
        this.slug,
        this.taxonomies,
        this.restBase,
        this.lLinks});

  WpBlock.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    hierarchical = json['hierarchical'];
    name = json['name'];
    slug = json['slug'];
    /*if (json['taxonomies'] != null) {
      taxonomies = new List<Null>();
      json['taxonomies'].forEach((v) {
        taxonomies.add(new Null.fromJson(v));
      });
    }*/
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['hierarchical'] = this.hierarchical;
    data['name'] = this.name;
    data['slug'] = this.slug;
    /*if (this.taxonomies != null) {
      data['taxonomies'] = this.taxonomies.map((v) => v.toJson()).toList();
    }*/
    data['rest_base'] = this.restBase;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}
