import 'links.dart';
import 'avatar_urls.dart';

class Users {
  int id;
  String name;
  String url;
  String description;
  String link;
  String slug;
  AvatarUrls avatarUrls;
  List<Null> meta;
  Links lLinks;

  Users(
      {this.id,
        this.name,
        this.url,
        this.description,
        this.link,
        this.slug,
        this.avatarUrls,
        this.meta,
        this.lLinks});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    description = json['description'];
    link = json['link'];
    slug = json['slug'];
    avatarUrls = json['avatar_urls'] != null
        ? new AvatarUrls.fromJson(json['avatar_urls'])
        : null;
    /*if (json['meta'] != null) {
      meta = new List<Null>();
      json['meta'].forEach((v) {
        meta.add(new Null.fromJson(v));
      });
    }*/
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['description'] = this.description;
    data['link'] = this.link;
    data['slug'] = this.slug;
    if (this.avatarUrls != null) {
      data['avatar_urls'] = this.avatarUrls.toJson();
    }
    /*if (this.meta != null) {
      data['meta'] = this.meta.map((v) => v.toJson()).toList();
    }*/
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

