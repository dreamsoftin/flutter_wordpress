import 'links.dart';

class PostStatuses {
  Publish publish;

  PostStatuses({this.publish});

  PostStatuses.fromJson(Map<String, dynamic> json) {
    publish =
    json['publish'] != null ? new Publish.fromJson(json['publish']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.publish != null) {
      data['publish'] = this.publish.toJson();
    }
    return data;
  }
}

class Publish {
  String name;
  bool public;
  bool queryable;
  String slug;
  Links lLinks;

  Publish({this.name, this.public, this.queryable, this.slug, this.lLinks});

  Publish.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    public = json['public'];
    queryable = json['queryable'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['slug'] = this.slug;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}
