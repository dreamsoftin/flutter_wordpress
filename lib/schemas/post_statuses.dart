import 'links.dart';

class PostStatuses {
  Publish? publish;
  Future? future;
  Draft? draft;
  Pending? pending;
  Private? private;
  Trash? trash;

  PostStatuses({
    this.publish,
    this.future,
    this.draft,
    this.pending,
    this.private,
    this.trash,
  });

  PostStatuses.fromJson(Map<String, dynamic> json) {
    publish =
        json['publish'] != null ? new Publish.fromJson(json['publish']) : null;
    future =
        json['future'] != null ? new Future.fromJson(json['future']) : null;
    draft = json['draft'] != null ? new Draft.fromJson(json['draft']) : null;
    pending =
        json['pending'] != null ? new Pending.fromJson(json['pending']) : null;
    private =
        json['private'] != null ? new Private.fromJson(json['private']) : null;
    trash = json['trash'] != null ? new Trash.fromJson(json['trash']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['publish'] = this.publish?.toJson();
    data['future'] = this.future?.toJson();
    data['draft'] = this.draft?.toJson();
    data['pending'] = this.pending?.toJson();
    data['private'] = this.private?.toJson();
    data['trash'] = this.trash?.toJson();

    return data;
  }
}

class Publish {
  String? name;
  bool? private;
  bool? protected;
  bool? public;
  bool? queryable;
  bool? showInList;
  String? slug;
  Links? lLinks;

  Publish({
    this.name,
    this.private,
    this.protected,
    this.public,
    this.queryable,
    this.showInList,
    this.slug,
    this.lLinks,
  });

  Publish.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    private = json['private'];
    protected = json['protected'];
    public = json['public'];
    queryable = json['queryable'];
    showInList = json['show_in_list'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['private'] = this.private;
    data['protected'] = this.protected;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['show_in_list'] = this.showInList;
    data['slug'] = this.slug;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Future {
  String? name;
  bool? private;
  bool? protected;
  bool? public;
  bool? queryable;
  bool? showInList;
  String? slug;
  Links? lLinks;

  Future({
    this.name,
    this.private,
    this.protected,
    this.public,
    this.queryable,
    this.showInList,
    this.slug,
    this.lLinks,
  });

  Future.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    private = json['private'];
    protected = json['protected'];
    public = json['public'];
    queryable = json['queryable'];
    showInList = json['show_in_list'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['private'] = this.private;
    data['protected'] = this.protected;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['show_in_list'] = this.showInList;
    data['slug'] = this.slug;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Draft {
  String? name;
  bool? private;
  bool? protected;
  bool? public;
  bool? queryable;
  bool? showInList;
  String? slug;
  Links? lLinks;

  Draft({
    this.name,
    this.private,
    this.protected,
    this.public,
    this.queryable,
    this.showInList,
    this.slug,
    this.lLinks,
  });

  Draft.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    private = json['private'];
    protected = json['protected'];
    public = json['public'];
    queryable = json['queryable'];
    showInList = json['show_in_list'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['private'] = this.private;
    data['protected'] = this.protected;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['show_in_list'] = this.showInList;
    data['slug'] = this.slug;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Pending {
  String? name;
  bool? private;
  bool? protected;
  bool? public;
  bool? queryable;
  bool? showInList;
  String? slug;
  Links? lLinks;

  Pending({
    this.name,
    this.private,
    this.protected,
    this.public,
    this.queryable,
    this.showInList,
    this.slug,
    this.lLinks,
  });

  Pending.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    private = json['private'];
    protected = json['protected'];
    public = json['public'];
    queryable = json['queryable'];
    showInList = json['show_in_list'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['private'] = this.private;
    data['protected'] = this.protected;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['show_in_list'] = this.showInList;
    data['slug'] = this.slug;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Private {
  String? name;
  bool? private;
  bool? protected;
  bool? public;
  bool? queryable;
  bool? showInList;
  String? slug;
  Links? lLinks;

  Private({
    this.name,
    this.private,
    this.protected,
    this.public,
    this.queryable,
    this.showInList,
    this.slug,
    this.lLinks,
  });

  Private.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    private = json['private'];
    protected = json['protected'];
    public = json['public'];
    queryable = json['queryable'];
    showInList = json['show_in_list'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['private'] = this.private;
    data['protected'] = this.protected;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['show_in_list'] = this.showInList;
    data['slug'] = this.slug;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Trash {
  String? name;
  bool? private;
  bool? protected;
  bool? public;
  bool? queryable;
  bool? showInList;
  String? slug;
  Links? lLinks;

  Trash({
    this.name,
    this.private,
    this.protected,
    this.public,
    this.queryable,
    this.showInList,
    this.slug,
    this.lLinks,
  });

  Trash.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    private = json['private'];
    protected = json['protected'];
    public = json['public'];
    queryable = json['queryable'];
    showInList = json['show_in_list'];
    slug = json['slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['private'] = this.private;
    data['protected'] = this.protected;
    data['public'] = this.public;
    data['queryable'] = this.queryable;
    data['show_in_list'] = this.showInList;
    data['slug'] = this.slug;
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}
