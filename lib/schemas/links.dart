class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<About>? about;
  List<Author>? author;
  List<Replies>? replies;
  List<Archives>? archives;
  List<VersionHistory>? versionHistory;
  List<WpPostType>? wpPostType;
  List<PredecessorVersion>? predecessorVersion;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<WpAttachment>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<WpActionPublish>? wpActionPublish;
  List<WpActionUnfilteredHtml>? wpActionUnfilteredHtml;
  List<WpActionSticky>? wpActionSticky;
  List<WpActionAssignAuthor>? wpActionAssignAuthor;
  List<WpActionCreateCategories>? wpActionCreateCategories;
  List<WpActionAssignCategories>? wpActionAssignCategories;
  List<WpActionCreateTags>? wpActionCreateTags;
  List<WpActionAssignTags>? wpActionAssignTags;
  List<WpItems>? wpItems;
  List<Up>? up;
  List<InReplyTo>? inReplyTo;
  List<Children>? children;
  List<Curies>? curies;

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self?.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection?.add(new Collection.fromJson(v));
      });
    }
    if (json['about'] != null) {
      about = [];
      json['about'].forEach((v) {
        about?.add(new About.fromJson(v));
      });
    }
    if (json['author'] != null) {
      author = [];
      json['author'].forEach((v) {
        author?.add(new Author.fromJson(v));
      });
    }
    if (json['replies'] != null) {
      replies = [];
      json['replies'].forEach((v) {
        replies?.add(new Replies.fromJson(v));
      });
    }
    if (json['archives'] != null) {
      archives = [];
      json['archives'].forEach((v) {
        archives?.add(new Archives.fromJson(v));
      });
    }
    if (json['version-history'] != null) {
      versionHistory = [];
      json['version-history'].forEach((v) {
        versionHistory?.add(new VersionHistory.fromJson(v));
      });
    }
    if (json['wp:post_type'] != null) {
      wpPostType = [];
      json['wp:post_type'].forEach((v) {
        wpPostType?.add(new WpPostType.fromJson(v));
      });
    }
    if (json['predecessor-version'] != null) {
      predecessorVersion = [];
      json['predecessor-version'].forEach((v) {
        predecessorVersion?.add(new PredecessorVersion.fromJson(v));
      });
    }
    if (json['wp:featuredmedia'] != null) {
      wpFeaturedmedia = [];
      json['wp:featuredmedia'].forEach((v) {
        wpFeaturedmedia?.add(new WpFeaturedmedia.fromJson(v));
      });
    }
    if (json['wp:attachment'] != null) {
      wpAttachment = [];
      json['wp:attachment'].forEach((v) {
        wpAttachment?.add(new WpAttachment.fromJson(v));
      });
    }
    if (json['wp:term'] != null) {
      wpTerm = [];
      json['wp:term'].forEach((v) {
        wpTerm?.add(new WpTerm.fromJson(v));
      });
    }
    if (json['wp:action-publish'] != null) {
      wpActionPublish = [];
      json['wp:action-publish'].forEach((v) {
        wpActionPublish?.add(new WpActionPublish.fromJson(v));
      });
    }
    if (json['wp:action-unfiltered-html'] != null) {
      wpActionUnfilteredHtml = [];
      json['wp:action-unfiltered-html'].forEach((v) {
        wpActionUnfilteredHtml?.add(new WpActionUnfilteredHtml.fromJson(v));
      });
    }
    if (json['wp:action-sticky'] != null) {
      wpActionSticky = [];
      json['wp:action-sticky'].forEach((v) {
        wpActionSticky?.add(new WpActionSticky.fromJson(v));
      });
    }
    if (json['wp:action-assign-author'] != null) {
      wpActionAssignAuthor = [];
      json['wp:action-assign-author'].forEach((v) {
        wpActionAssignAuthor?.add(new WpActionAssignAuthor.fromJson(v));
      });
    }
    if (json['wp:action-create-categories'] != null) {
      wpActionCreateCategories = [];
      json['wp:action-create-categories'].forEach((v) {
        wpActionCreateCategories?.add(new WpActionCreateCategories.fromJson(v));
      });
    }
    if (json['wp:action-assign-categories'] != null) {
      wpActionAssignCategories = [];
      json['wp:action-assign-categories'].forEach((v) {
        wpActionAssignCategories?.add(new WpActionAssignCategories.fromJson(v));
      });
    }
    if (json['wp:action-create-tags'] != null) {
      wpActionCreateTags = [];
      json['wp:action-create-tags'].forEach((v) {
        wpActionCreateTags?.add(new WpActionCreateTags.fromJson(v));
      });
    }
    if (json['wp:action-assign-tags'] != null) {
      wpActionAssignTags = [];
      json['wp:action-assign-tags'].forEach((v) {
        wpActionAssignTags?.add(new WpActionAssignTags.fromJson(v));
      });
    }
    if (json['wp:items'] != null) {
      wpItems = [];
      json['wp:items'].forEach((v) {
        wpItems?.add(new WpItems.fromJson(v));
      });
    }
    if (json['up'] != null) {
      up = [];
      json['up'].forEach((v) {
        up?.add(new Up.fromJson(v));
      });
    }
    if (json['in-reply-to'] != null) {
      inReplyTo = [];
      json['in-reply-to'].forEach((v) {
        inReplyTo?.add(new InReplyTo.fromJson(v));
      });
    }
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(new Children.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      curies = [];
      json['curies'].forEach((v) {
        curies?.add(new Curies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['self'] = this.self?.map((v) => v.toJson()).toList();
    data['collection'] = this.collection?.map((v) => v.toJson()).toList();
    data['about'] = this.about?.map((v) => v.toJson()).toList();
    data['author'] = this.author?.map((v) => v.toJson()).toList();
    data['replies'] = this.replies?.map((v) => v.toJson()).toList();
    data['archives'] = this.archives?.map((v) => v.toJson()).toList();
    data['version-history'] =
        this.versionHistory?.map((v) => v.toJson()).toList();
    data['wp:post_type'] = this.wpPostType?.map((v) => v.toJson()).toList();
    data['predecessor-version'] =
        this.predecessorVersion?.map((v) => v.toJson()).toList();
    data['wp:featuredmedia'] =
        this.wpFeaturedmedia?.map((v) => v.toJson()).toList();
    data['wp:attachment'] = this.wpAttachment?.map((v) => v.toJson()).toList();
    data['wp:term'] = this.wpTerm?.map((v) => v.toJson()).toList();
    data['wp:action-publish'] =
        this.wpActionPublish?.map((v) => v.toJson()).toList();
    data['wp:action-unfiltered-html'] =
        this.wpActionUnfilteredHtml?.map((v) => v.toJson()).toList();
    data['wp:action-sticky'] =
        this.wpActionSticky?.map((v) => v.toJson()).toList();
    data['wp:action-assign-author'] =
        this.wpActionAssignAuthor?.map((v) => v.toJson()).toList();
    data['wp:action-create-categories'] =
        this.wpActionCreateCategories?.map((v) => v.toJson()).toList();
    data['wp:action-assign-categories'] =
        this.wpActionAssignCategories?.map((v) => v.toJson()).toList();
    data['wp:action-create-tags'] =
        this.wpActionCreateTags?.map((v) => v.toJson()).toList();
    data['wp:action-assign-tags'] =
        this.wpActionAssignTags?.map((v) => v.toJson()).toList();
    data['wp:items'] = this.wpItems?.map((v) => v.toJson()).toList();
    data['up'] = this.up?.map((v) => v.toJson()).toList();
    data['in-reply-to'] = this.inReplyTo?.map((v) => v.toJson()).toList();
    data['children'] = this.children?.map((v) => v.toJson()).toList();
    data['curies'] = this.curies?.map((v) => v.toJson()).toList();

    return data;
  }
}

class Self {
  String? href;

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
  String? href;

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
  String? href;

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
  bool? embeddable;
  String? href;

  Author({
    this.embeddable,
    this.href,
  });

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
  bool? embeddable;
  String? href;

  Replies({
    this.embeddable,
    this.href,
  });

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
  String? href;

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
  int? count;
  String? href;

  VersionHistory({
    this.count,
    this.href,
  });

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
  String? href;

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
  int? id;
  String? href;

  PredecessorVersion({
    this.id,
    this.href,
  });

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
  bool? embeddable;
  String? href;

  WpFeaturedmedia({
    this.embeddable,
    this.href,
  });

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
  String? href;

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
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

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
  String? href;

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
  String? href;

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
  String? href;

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
  String? href;

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
  String? href;

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
  String? href;

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
  String? href;

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
  String? href;

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
  String? href;

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
  bool? embeddable;
  String? postType;
  String? href;

  Up({
    this.embeddable,
    this.postType,
    this.href,
  });

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
  bool? embeddable;
  String? href;

  InReplyTo({
    this.embeddable,
    this.href,
  });

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
  String? href;

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
  String? name;
  String? href;
  bool? templated;

  Curies({
    this.name,
    this.href,
    this.templated,
  });

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
