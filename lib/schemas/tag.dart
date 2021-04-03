import 'links.dart';

class Tag {
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  Links? lLinks;

  Tag({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.lLinks,
  });

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    description = json['description'];
    link = json['link'];
    name = json['name'];
    slug = json['slug'];
    taxonomy = json['taxonomy'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['count'] = this.count;
    data['description'] = this.description;
    data['link'] = this.link;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['taxonomy'] = this.taxonomy;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}
