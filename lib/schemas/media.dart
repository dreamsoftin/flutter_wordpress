import 'links.dart';
import 'guid.dart';
import 'title.dart';

class Media {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Title title;
  int author;
  String commentStatus;
  String pingStatus;
  String template;
//  List<Null> meta;
  String permalinkTemplate;
  String generatedSlug;
  Description description;
  Caption caption;
  String altText;
  String mediaType;
  String mimeType;
  MediaDetails mediaDetails;
  int post;
  String sourceUrl;
  Links lLinks;

  Media(
      {this.id,
      this.date,
      this.dateGmt,
      this.guid,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.type,
      this.link,
      this.title,
      this.author,
      this.commentStatus,
      this.pingStatus,
      this.template,
//        this.meta,
      this.permalinkTemplate,
      this.generatedSlug,
      this.description,
      this.caption,
      this.altText,
      this.mediaType,
      this.mimeType,
      this.mediaDetails,
      this.post,
      this.sourceUrl,
      this.lLinks});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    author = json['author'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    /*if (json['meta'] != null) {
      meta = new List<Null>();
      json['meta'].forEach((v) {
        meta.add(new Null.fromJson(v));
      });
    }*/
    permalinkTemplate = json['permalink_template'];
    generatedSlug = json['generated_slug'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    caption =
        json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    altText = json['alt_text'];
    mediaType = json['media_type'];
    mimeType = json['mime_type'];
    mediaDetails = json['media_details'] != null
        ? new MediaDetails.fromJson(json['media_details'])
        : null;
    post = json['post'];
    sourceUrl = json['source_url'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    data['author'] = this.author;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['template'] = this.template;
    /*if (this.meta != null) {
      data['meta'] = this.meta.map((v) => v.toJson()).toList();
    }*/
    data['permalink_template'] = this.permalinkTemplate;
    data['generated_slug'] = this.generatedSlug;
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.caption != null) {
      data['caption'] = this.caption.toJson();
    }
    data['alt_text'] = this.altText;
    data['media_type'] = this.mediaType;
    data['mime_type'] = this.mimeType;
    if (this.mediaDetails != null) {
      data['media_details'] = this.mediaDetails.toJson();
    }
    data['post'] = this.post;
    data['source_url'] = this.sourceUrl;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Description {
  String raw;
  String rendered;

  Description({this.raw, this.rendered});

  Description.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['rendered'] = this.rendered;
    return data;
  }
}

class Caption {
  String raw;
  String rendered;

  Caption({this.raw, this.rendered});

  Caption.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['rendered'] = this.rendered;
    return data;
  }
}

class MediaDetails {
  int width;
  int height;
  String file;
  Sizes sizes;
  ImageMeta imageMeta;

  MediaDetails(
      {this.width, this.height, this.file, this.sizes, this.imageMeta});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    file = json['file'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    imageMeta = json['image_meta'] != null
        ? new ImageMeta.fromJson(json['image_meta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['file'] = this.file;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    if (this.imageMeta != null) {
      data['image_meta'] = this.imageMeta.toJson();
    }
    return data;
  }
}

class Sizes {
  Thumbnail thumbnail;
  Medium medium;
  MediumLarge mediumLarge;
  Large large;
  PostThumbnail postThumbnail;
  Full full;

  Sizes(
      {this.thumbnail,
      this.medium,
      this.mediumLarge,
      this.postThumbnail,
      this.large,
      this.full});

  Sizes.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    medium =
        json['medium'] != null ? new Medium.fromJson(json['medium']) : null;
    mediumLarge = json['medium_large'] != null
        ? new MediumLarge.fromJson(json['medium_large'])
        : null;
    large = json['large'] != null ? new Large.fromJson(json['large']) : null;
    postThumbnail = json['post-thumbnail'] != null
        ? new PostThumbnail.fromJson(json['post-thumbnail'])
        : null;
    full = json['full'] != null ? new Full.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    if (this.mediumLarge != null) {
      data['medium_large'] = this.mediumLarge.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.postThumbnail != null) {
      data['post-thumbnail'] = this.postThumbnail.toJson();
    }
    if (this.full != null) {
      data['full'] = this.full.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  Thumbnail(
      {this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class Medium {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  Medium({this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  Medium.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class MediumLarge {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  MediumLarge(
      {this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  MediumLarge.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class Large {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  Large({this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  Large.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class PostThumbnail {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  PostThumbnail(
      {this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  PostThumbnail.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class Full {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  Full({this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  Full.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class ImageMeta {
  String aperture;
  String credit;
  String camera;
  String caption;
  String createdTimestamp;
  String copyright;
  String focalLength;
  String iso;
  String shutterSpeed;
  String title;
  String orientation;
//  List<String> keywords;

  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
//      this.keywords,
  });

  ImageMeta.fromJson(Map<String, dynamic> json) {
    aperture = json['aperture'];
    credit = json['credit'];
    camera = json['camera'];
    caption = json['caption'];
    createdTimestamp = json['created_timestamp'];
    copyright = json['copyright'];
    focalLength = json['focal_length'];
    iso = json['iso'];
    shutterSpeed = json['shutter_speed'];
    title = json['title'];
    orientation = json['orientation'];
//    keywords = json['keywords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aperture'] = this.aperture;
    data['credit'] = this.credit;
    data['camera'] = this.camera;
    data['caption'] = this.caption;
    data['created_timestamp'] = this.createdTimestamp;
    data['copyright'] = this.copyright;
    data['focal_length'] = this.focalLength;
    data['iso'] = this.iso;
    data['shutter_speed'] = this.shutterSpeed;
    data['title'] = this.title;
    data['orientation'] = this.orientation;
//    data['keywords'] = this.keywords;
    return data;
  }
}
