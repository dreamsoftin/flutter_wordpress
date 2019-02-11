import 'links.dart';

class Taxonomies {
  Category category;
  PostTag postTag;

  Taxonomies({this.category, this.postTag});

  Taxonomies.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    postTag = json['post_tag'] != null
        ? new PostTag.fromJson(json['post_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.postTag != null) {
      data['post_tag'] = this.postTag.toJson();
    }
    return data;
  }
}

class Category {
  String name;
  String slug;
  String description;
  List<String> types;
  bool hierarchical;
  String restBase;
  Links lLinks;

  Category(
      {this.name,
        this.slug,
        this.description,
        this.types,
        this.hierarchical,
        this.restBase,
        this.lLinks});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    types = json['types'].cast<String>();
    hierarchical = json['hierarchical'];
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['types'] = this.types;
    data['hierarchical'] = this.hierarchical;
    data['rest_base'] = this.restBase;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class PostTag {
  String name;
  String slug;
  String description;
  List<String> types;
  bool hierarchical;
  String restBase;
  Links lLinks;

  PostTag(
      {this.name,
        this.slug,
        this.description,
        this.types,
        this.hierarchical,
        this.restBase,
        this.lLinks});

  PostTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    types = json['types'].cast<String>();
    hierarchical = json['hierarchical'];
    restBase = json['rest_base'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['types'] = this.types;
    data['hierarchical'] = this.hierarchical;
    data['rest_base'] = this.restBase;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}
