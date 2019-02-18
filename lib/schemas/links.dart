class Links {
  List<Self> self;
  List<Collection> collection;
  List<About> about;
  List<Author> author;
  List<Replies> replies;
  List<Archives> archives;
  List<VersionHistory> versionHistory;
  List<WpPostType> wpPostType;
  List<PredecessorVersion> predecessorVersion;
  List<WpFeaturedmedia> wpFeaturedmedia;
  List<WpAttachment> wpAttachment;
  List<WpTerm> wpTerm;
  List<WpActionPublish> wpActionPublish;
  List<WpActionUnfilteredHtml> wpActionUnfilteredHtml;
  List<WpActionSticky> wpActionSticky;
  List<WpActionAssignAuthor> wpActionAssignAuthor;
  List<WpActionCreateCategories> wpActionCreateCategories;
  List<WpActionAssignCategories> wpActionAssignCategories;
  List<WpActionCreateTags> wpActionCreateTags;
  List<WpActionAssignTags> wpActionAssignTags;
  List<WpItems> wpItems;
  List<Up> up;
  List<InReplyTo> inReplyTo;
  List<Children> children;
  List<Curies> curies;

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = new List<Collection>();
      json['collection'].forEach((v) {
        collection.add(new Collection.fromJson(v));
      });
    }
    if (json['about'] != null) {
      about = new List<About>();
      json['about'].forEach((v) {
        about.add(new About.fromJson(v));
      });
    }
    if (json['author'] != null) {
      author = new List<Author>();
      json['author'].forEach((v) {
        author.add(new Author.fromJson(v));
      });
    }
    if (json['replies'] != null) {
      replies = new List<Replies>();
      json['replies'].forEach((v) {
        replies.add(new Replies.fromJson(v));
      });
    }
    if (json['archives'] != null) {
      archives = new List<Archives>();
      json['archives'].forEach((v) {
        archives.add(new Archives.fromJson(v));
      });
    }
    if (json['version-history'] != null) {
      versionHistory = new List<VersionHistory>();
      json['version-history'].forEach((v) {
        versionHistory.add(new VersionHistory.fromJson(v));
      });
    }
    if (json['wp:post_type'] != null) {
      wpPostType = new List<WpPostType>();
      json['wp:post_type'].forEach((v) {
        wpPostType.add(new WpPostType.fromJson(v));
      });
    }
    if (json['predecessor-version'] != null) {
      predecessorVersion = new List<PredecessorVersion>();
      json['predecessor-version'].forEach((v) {
        predecessorVersion.add(new PredecessorVersion.fromJson(v));
      });
    }
    if (json['wp:featuredmedia'] != null) {
      wpFeaturedmedia = new List<WpFeaturedmedia>();
      json['wp:featuredmedia'].forEach((v) {
        wpFeaturedmedia.add(new WpFeaturedmedia.fromJson(v));
      });
    }
    if (json['wp:attachment'] != null) {
      wpAttachment = new List<WpAttachment>();
      json['wp:attachment'].forEach((v) {
        wpAttachment.add(new WpAttachment.fromJson(v));
      });
    }
    if (json['wp:term'] != null) {
      wpTerm = new List<WpTerm>();
      json['wp:term'].forEach((v) {
        wpTerm.add(new WpTerm.fromJson(v));
      });
    }
    if (json['wp:action-publish'] != null) {
      wpActionPublish = new List<WpActionPublish>();
      json['wp:action-publish'].forEach((v) {
        wpActionPublish.add(new WpActionPublish.fromJson(v));
      });
    }
    if (json['wp:action-unfiltered-html'] != null) {
      wpActionUnfilteredHtml = new List<WpActionUnfilteredHtml>();
      json['wp:action-unfiltered-html'].forEach((v) {
        wpActionUnfilteredHtml.add(new WpActionUnfilteredHtml.fromJson(v));
      });
    }
    if (json['wp:action-sticky'] != null) {
      wpActionSticky = new List<WpActionSticky>();
      json['wp:action-sticky'].forEach((v) {
        wpActionSticky.add(new WpActionSticky.fromJson(v));
      });
    }
    if (json['wp:action-assign-author'] != null) {
      wpActionAssignAuthor = new List<WpActionAssignAuthor>();
      json['wp:action-assign-author'].forEach((v) {
        wpActionAssignAuthor.add(new WpActionAssignAuthor.fromJson(v));
      });
    }
    if (json['wp:action-create-categories'] != null) {
      wpActionCreateCategories = new List<WpActionCreateCategories>();
      json['wp:action-create-categories'].forEach((v) {
        wpActionCreateCategories.add(new WpActionCreateCategories.fromJson(v));
      });
    }
    if (json['wp:action-assign-categories'] != null) {
      wpActionAssignCategories = new List<WpActionAssignCategories>();
      json['wp:action-assign-categories'].forEach((v) {
        wpActionAssignCategories.add(new WpActionAssignCategories.fromJson(v));
      });
    }
    if (json['wp:action-create-tags'] != null) {
      wpActionCreateTags = new List<WpActionCreateTags>();
      json['wp:action-create-tags'].forEach((v) {
        wpActionCreateTags.add(new WpActionCreateTags.fromJson(v));
      });
    }
    if (json['wp:action-assign-tags'] != null) {
      wpActionAssignTags = new List<WpActionAssignTags>();
      json['wp:action-assign-tags'].forEach((v) {
        wpActionAssignTags.add(new WpActionAssignTags.fromJson(v));
      });
    }
    if (json['wp:items'] != null) {
      wpItems = new List<WpItems>();
      json['wp:items'].forEach((v) {
        wpItems.add(new WpItems.fromJson(v));
      });
    }
    if (json['up'] != null) {
      up = new List<Up>();
      json['up'].forEach((v) {
        up.add(new Up.fromJson(v));
      });
    }
    if (json['in-reply-to'] != null) {
      inReplyTo = new List<InReplyTo>();
      json['in-reply-to'].forEach((v) {
        inReplyTo.add(new InReplyTo.fromJson(v));
      });
    }
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      curies = new List<Curies>();
      json['curies'].forEach((v) {
        curies.add(new Curies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
    }
    if (this.about != null) {
      data['about'] = this.about.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['author'] = this.author.map((v) => v.toJson()).toList();
    }
    if (this.replies != null) {
      data['replies'] = this.replies.map((v) => v.toJson()).toList();
    }
    if (this.archives != null) {
      data['archives'] = this.archives.map((v) => v.toJson()).toList();
    }
    if (this.versionHistory != null) {
      data['version-history'] =
          this.versionHistory.map((v) => v.toJson()).toList();
    }
    if (this.wpPostType != null) {
      data['wp:post_type'] = this.wpPostType.map((v) => v.toJson()).toList();
    }
    if (this.predecessorVersion != null) {
      data['predecessor-version'] =
          this.predecessorVersion.map((v) => v.toJson()).toList();
    }
    if (this.wpFeaturedmedia != null) {
      data['wp:featuredmedia'] =
          this.wpFeaturedmedia.map((v) => v.toJson()).toList();
    }
    if (this.wpAttachment != null) {
      data['wp:attachment'] = this.wpAttachment.map((v) => v.toJson()).toList();
    }
    if (this.wpTerm != null) {
      data['wp:term'] = this.wpTerm.map((v) => v.toJson()).toList();
    }
    if (this.wpActionPublish != null) {
      data['wp:action-publish'] =
          this.wpActionPublish.map((v) => v.toJson()).toList();
    }
    if (this.wpActionUnfilteredHtml != null) {
      data['wp:action-unfiltered-html'] =
          this.wpActionUnfilteredHtml.map((v) => v.toJson()).toList();
    }
    if (this.wpActionSticky != null) {
      data['wp:action-sticky'] =
          this.wpActionSticky.map((v) => v.toJson()).toList();
    }
    if (this.wpActionAssignAuthor != null) {
      data['wp:action-assign-author'] =
          this.wpActionAssignAuthor.map((v) => v.toJson()).toList();
    }
    if (this.wpActionCreateCategories != null) {
      data['wp:action-create-categories'] =
          this.wpActionCreateCategories.map((v) => v.toJson()).toList();
    }
    if (this.wpActionAssignCategories != null) {
      data['wp:action-assign-categories'] =
          this.wpActionAssignCategories.map((v) => v.toJson()).toList();
    }
    if (this.wpActionCreateTags != null) {
      data['wp:action-create-tags'] =
          this.wpActionCreateTags.map((v) => v.toJson()).toList();
    }
    if (this.wpActionAssignTags != null) {
      data['wp:action-assign-tags'] =
          this.wpActionAssignTags.map((v) => v.toJson()).toList();
    }
    if (this.wpItems != null) {
      data['wp:items'] = this.wpItems.map((v) => v.toJson()).toList();
    }
    if (this.up != null) {
      data['up'] = this.up.map((v) => v.toJson()).toList();
    }
    if (this.inReplyTo != null) {
      data['in-reply-to'] = this.inReplyTo.map((v) => v.toJson()).toList();
    }
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    if (this.curies != null) {
      data['curies'] = this.curies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Collection {
  String href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class About {
  String href;

  About({this.href});

  About.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Author {
  bool embeddable;
  String href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.embeddable != null) {
      data['embeddable'] = this.embeddable;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Replies {
  bool embeddable;
  String href;

  Replies({this.embeddable, this.href});

  Replies.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.embeddable != null) {
      data['embeddable'] = this.embeddable;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Archives {
  String href;

  Archives({this.href});

  Archives.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class VersionHistory {
  int count;
  String href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.count != null) {
      data['count'] = this.count;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpPostType {
  String href;

  WpPostType({this.href});

  WpPostType.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class PredecessorVersion {
  int id;
  String href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpFeaturedmedia {
  bool embeddable;
  String href;

  WpFeaturedmedia({this.embeddable, this.href});

  WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.embeddable != null) {
      data['embeddable'] = this.embeddable;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpAttachment {
  String href;

  WpAttachment({this.href});

  WpAttachment.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpTerm {
  String taxonomy;
  bool embeddable;
  String href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.taxonomy != null) {
      data['taxonomy'] = this.taxonomy;
    }
    if (this.embeddable != null) {
      data['embeddable'] = this.embeddable;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionPublish {
  String href;

  WpActionPublish({this.href});

  WpActionPublish.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionUnfilteredHtml {
  String href;

  WpActionUnfilteredHtml({this.href});

  WpActionUnfilteredHtml.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionSticky {
  String href;

  WpActionSticky({this.href});

  WpActionSticky.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionAssignAuthor {
  String href;

  WpActionAssignAuthor({this.href});

  WpActionAssignAuthor.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionCreateCategories {
  String href;

  WpActionCreateCategories({this.href});

  WpActionCreateCategories.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionAssignCategories {
  String href;

  WpActionAssignCategories({this.href});

  WpActionAssignCategories.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionCreateTags {
  String href;

  WpActionCreateTags({this.href});

  WpActionCreateTags.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpActionAssignTags {
  String href;

  WpActionAssignTags({this.href});

  WpActionAssignTags.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class WpItems {
  String href;

  WpItems({this.href});

  WpItems.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Up {
  bool embeddable;
  String postType;
  String href;

  Up({this.embeddable, this.postType, this.href});

  Up.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    postType = json['post_type'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.embeddable != null) {
      data['embeddable'] = this.embeddable;
    }
    if (this.postType != null) {
      data['post_type'] = this.postType;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class InReplyTo {
  bool embeddable;
  String href;

  InReplyTo({this.embeddable, this.href});

  InReplyTo.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.embeddable != null) {
      data['embeddable'] = this.embeddable;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Children {
  String href;

  Children({this.href});

  Children.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.href != null) {
      data['href'] = this.href;
    }
    return data;
  }
}

class Curies {
  String name;
  String href;
  bool templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.href != null) {
      data['href'] = this.href;
    }
    if (this.templated != null) {
      data['templated'] = this.templated;
    }
    return data;
  }
}
