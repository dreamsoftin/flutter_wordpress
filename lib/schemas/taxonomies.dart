import 'capabilities.dart';
import 'labels.dart';
import 'links.dart';

class Taxonomies {
  TaxonomyCategory? category;
  TaxonomyPostTag? postTag;

  Taxonomies({
    this.category,
    this.postTag,
  });

  Taxonomies.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new TaxonomyCategory.fromJson(json['category'])
        : null;
    postTag = json['post_tag'] != null
        ? new TaxonomyPostTag.fromJson(json['post_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['category'] = this.category?.toJson();
    data['post_tag'] = this.postTag?.toJson();

    return data;
  }
}

class TaxonomyCategory {
  String? name;
  String? slug;
  Capabilities? capabilities;
  String? description;
  Labels? labels;
  List<String>? types;
  bool? showCloud;
  bool? hierarchical;
  String? restBase;
  Visibility? visibility;
  Links? lLinks;

  TaxonomyCategory({
    this.name,
    this.slug,
    this.capabilities,
    this.description,
    this.labels,
    this.types,
    this.showCloud,
    this.hierarchical,
    this.restBase,
    this.visibility,
    this.lLinks,
  });

  TaxonomyCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    description = json['description'];
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
    types = json['types'].cast<String>();
    showCloud = json['show_cloud'];
    hierarchical = json['hierarchical'];
    restBase = json['rest_base'];
    visibility = json['visibility'] != null
        ? new Visibility.fromJson(json['visibility'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['slug'] = this.slug;
    data['capabilities'] = this.capabilities?.toJson();
    data['description'] = this.description;
    data['labels'] = this.labels?.toJson();
    data['types'] = this.types;
    data['show_cloud'] = this.showCloud;
    data['hierarchical'] = this.hierarchical;
    data['rest_base'] = this.restBase;
    data['visibility'] = this.visibility?.toJson();
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}

class Visibility {
  bool? public;
  bool? publiclyQueryable;
  bool? showAdminColumn;
  bool? showInNavMenus;
  bool? showInQuickEdit;
  bool? showUi;

  Visibility({
    this.public,
    this.publiclyQueryable,
    this.showAdminColumn,
    this.showInNavMenus,
    this.showInQuickEdit,
    this.showUi,
  });

  Visibility.fromJson(Map<String, dynamic> json) {
    public = json['public'];
    publiclyQueryable = json['publicly_queryable'];
    showAdminColumn = json['show_admin_column'];
    showInNavMenus = json['show_in_nav_menus'];
    showInQuickEdit = json['show_in_quick_edit'];
    showUi = json['show_ui'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['public'] = this.public;
    data['publicly_queryable'] = this.publiclyQueryable;
    data['show_admin_column'] = this.showAdminColumn;
    data['show_in_nav_menus'] = this.showInNavMenus;
    data['show_in_quick_edit'] = this.showInQuickEdit;
    data['show_ui'] = this.showUi;

    return data;
  }
}

class TaxonomyPostTag {
  String? name;
  String? slug;
  Capabilities? capabilities;
  String? description;
  Labels? labels;
  List<String>? types;
  bool? showCloud;
  bool? hierarchical;
  String? restBase;
  Visibility? visibility;
  Links? lLinks;

  TaxonomyPostTag({
    this.name,
    this.slug,
    this.capabilities,
    this.description,
    this.labels,
    this.types,
    this.showCloud,
    this.hierarchical,
    this.restBase,
    this.visibility,
    this.lLinks,
  });

  TaxonomyPostTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    description = json['description'];
    labels =
        json['labels'] != null ? new Labels.fromJson(json['labels']) : null;
    types = json['types'].cast<String>();
    showCloud = json['show_cloud'];
    hierarchical = json['hierarchical'];
    restBase = json['rest_base'];
    visibility = json['visibility'] != null
        ? new Visibility.fromJson(json['visibility'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['slug'] = this.slug;
    data['capabilities'] = this.capabilities?.toJson();
    data['labels'] = this.labels?.toJson();
    data['description'] = this.description;
    data['types'] = this.types;
    data['show_cloud'] = this.showCloud;
    data['hierarchical'] = this.hierarchical;
    data['rest_base'] = this.restBase;
    data['visibility'] = this.visibility?.toJson();
    data['_links'] = this.lLinks?.toJson();

    return data;
  }
}
