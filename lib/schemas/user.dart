import 'avatar_urls.dart';
import 'links.dart';

class User {
  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? url;
  String? description;
  String? link;
  String? locale;
  String? nickname;
  String? slug;
  List<String>? roles;
  String? registeredDate;
  UserCapabilities? capabilities;
  UserExtraCapabilities? extraCapabilities;
  AvatarUrls? avatarUrls;
  Map<String, dynamic>? meta;
  Links? lLinks;
//  yahya - @mymakarim
  String? password;
//  end yahya - @mymakarim

  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.roles,
    this.registeredDate,
    this.capabilities,
    this.extraCapabilities,
    this.avatarUrls,
    this.meta,
    this.lLinks,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    url = json['url'];
    description = json['description'];
    link = json['link'];
    locale = json['locale'];
    nickname = json['nickname'];
    slug = json['slug'];
    if (json['roles'] != null) roles = json['roles'].cast<String>();
    registeredDate = json['registered_date'];
    capabilities = json['capabilities'] != null
        ? new UserCapabilities.fromJson(json['capabilities'])
        : null;
    extraCapabilities = json['extra_capabilities'] != null
        ? new UserExtraCapabilities.fromJson(json['extra_capabilities'])
        : null;
    avatarUrls = json['avatar_urls'] != null
        ? new AvatarUrls.fromJson(json['avatar_urls'])
        : null;

    if (json['meta'] != null && json['meta'].length > 0) {
      meta = new Map<String, dynamic>();
      json['meta'].forEach((k, v) {
        meta![k] = v;
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['url'] = this.url;
    data['description'] = this.description;
    data['link'] = this.link;
    data['locale'] = this.locale;
    data['nickname'] = this.nickname;
    data['slug'] = this.slug;
    data['roles'] = this.roles;
    data['registered_date'] = this.registeredDate;
    data['capabilities'] = this.capabilities?.toJson();
    data['extra_capabilities'] = this.extraCapabilities?.toJson();
    data['avatar_urls'] = this.avatarUrls?.toJson();
    data['meta'] = this.meta;
    data['_links'] = this.lLinks?.toJson();
    data['password'] = this.password;

    return data;
  }

  @override
  String toString() {
    return 'id: $id, name: $name';
  }
}

class UserCapabilities {
  bool? switchThemes;
  bool? editThemes;
  bool? activatePlugins;
  bool? editPlugins;
  bool? editUsers;
  bool? editFiles;
  bool? manageOptions;
  bool? moderateComments;
  bool? manageCategories;
  bool? manageLinks;
  bool? uploadFiles;
  bool? import;
  bool? unfilteredHtml;
  bool? editPosts;
  bool? editOthersPosts;
  bool? editPublishedPosts;
  bool? publishPosts;
  bool? editPages;
  bool? read;
  bool? level10;
  bool? level9;
  bool? level8;
  bool? level7;
  bool? level6;
  bool? level5;
  bool? level4;
  bool? level3;
  bool? level2;
  bool? level1;
  bool? level0;
  bool? editOthersPages;
  bool? editPublishedPages;
  bool? publishPages;
  bool? deletePages;
  bool? deleteOthersPages;
  bool? deletePublishedPages;
  bool? deletePosts;
  bool? deleteOthersPosts;
  bool? deletePublishedPosts;
  bool? deletePrivatePosts;
  bool? editPrivatePosts;
  bool? readPrivatePosts;
  bool? deletePrivatePages;
  bool? editPrivatePages;
  bool? readPrivatePages;
  bool? deleteUsers;
  bool? createUsers;
  bool? unfilteredUpload;
  bool? editDashboard;
  bool? updatePlugins;
  bool? deletePlugins;
  bool? installPlugins;
  bool? updateThemes;
  bool? installThemes;
  bool? updateCore;
  bool? listUsers;
  bool? removeUsers;
  bool? promoteUsers;
  bool? editThemeOptions;
  bool? deleteThemes;
  bool? export;
  bool? administrator;

  UserCapabilities({
    this.switchThemes,
    this.editThemes,
    this.activatePlugins,
    this.editPlugins,
    this.editUsers,
    this.editFiles,
    this.manageOptions,
    this.moderateComments,
    this.manageCategories,
    this.manageLinks,
    this.uploadFiles,
    this.import,
    this.unfilteredHtml,
    this.editPosts,
    this.editOthersPosts,
    this.editPublishedPosts,
    this.publishPosts,
    this.editPages,
    this.read,
    this.level10,
    this.level9,
    this.level8,
    this.level7,
    this.level6,
    this.level5,
    this.level4,
    this.level3,
    this.level2,
    this.level1,
    this.level0,
    this.editOthersPages,
    this.editPublishedPages,
    this.publishPages,
    this.deletePages,
    this.deleteOthersPages,
    this.deletePublishedPages,
    this.deletePosts,
    this.deleteOthersPosts,
    this.deletePublishedPosts,
    this.deletePrivatePosts,
    this.editPrivatePosts,
    this.readPrivatePosts,
    this.deletePrivatePages,
    this.editPrivatePages,
    this.readPrivatePages,
    this.deleteUsers,
    this.createUsers,
    this.unfilteredUpload,
    this.editDashboard,
    this.updatePlugins,
    this.deletePlugins,
    this.installPlugins,
    this.updateThemes,
    this.installThemes,
    this.updateCore,
    this.listUsers,
    this.removeUsers,
    this.promoteUsers,
    this.editThemeOptions,
    this.deleteThemes,
    this.export,
    this.administrator,
  });

  UserCapabilities.fromJson(Map<String, dynamic> json) {
    switchThemes = json['switch_themes'];
    editThemes = json['edit_themes'];
    activatePlugins = json['activate_plugins'];
    editPlugins = json['edit_plugins'];
    editUsers = json['edit_users'];
    editFiles = json['edit_files'];
    manageOptions = json['manage_options'];
    moderateComments = json['moderate_comments'];
    manageCategories = json['manage_categories'];
    manageLinks = json['manage_links'];
    uploadFiles = json['upload_files'];
    import = json['import'];
    unfilteredHtml = json['unfiltered_html'];
    editPosts = json['edit_posts'];
    editOthersPosts = json['edit_others_posts'];
    editPublishedPosts = json['edit_published_posts'];
    publishPosts = json['publish_posts'];
    editPages = json['edit_pages'];
    read = json['read'];
    level10 = json['level_10'];
    level9 = json['level_9'];
    level8 = json['level_8'];
    level7 = json['level_7'];
    level6 = json['level_6'];
    level5 = json['level_5'];
    level4 = json['level_4'];
    level3 = json['level_3'];
    level2 = json['level_2'];
    level1 = json['level_1'];
    level0 = json['level_0'];
    editOthersPages = json['edit_others_pages'];
    editPublishedPages = json['edit_published_pages'];
    publishPages = json['publish_pages'];
    deletePages = json['delete_pages'];
    deleteOthersPages = json['delete_others_pages'];
    deletePublishedPages = json['delete_published_pages'];
    deletePosts = json['delete_posts'];
    deleteOthersPosts = json['delete_others_posts'];
    deletePublishedPosts = json['delete_published_posts'];
    deletePrivatePosts = json['delete_private_posts'];
    editPrivatePosts = json['edit_private_posts'];
    readPrivatePosts = json['read_private_posts'];
    deletePrivatePages = json['delete_private_pages'];
    editPrivatePages = json['edit_private_pages'];
    readPrivatePages = json['read_private_pages'];
    deleteUsers = json['delete_users'];
    createUsers = json['create_users'];
    unfilteredUpload = json['unfiltered_upload'];
    editDashboard = json['edit_dashboard'];
    updatePlugins = json['update_plugins'];
    deletePlugins = json['delete_plugins'];
    installPlugins = json['install_plugins'];
    updateThemes = json['update_themes'];
    installThemes = json['install_themes'];
    updateCore = json['update_core'];
    listUsers = json['list_users'];
    removeUsers = json['remove_users'];
    promoteUsers = json['promote_users'];
    editThemeOptions = json['edit_theme_options'];
    deleteThemes = json['delete_themes'];
    export = json['export'];
    administrator = json['administrator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['switch_themes'] = this.switchThemes;
    data['edit_themes'] = this.editThemes;
    data['activate_plugins'] = this.activatePlugins;
    data['edit_plugins'] = this.editPlugins;
    data['edit_users'] = this.editUsers;
    data['edit_files'] = this.editFiles;
    data['manage_options'] = this.manageOptions;
    data['moderate_comments'] = this.moderateComments;
    data['manage_categories'] = this.manageCategories;
    data['manage_links'] = this.manageLinks;
    data['upload_files'] = this.uploadFiles;
    data['import'] = this.import;
    data['unfiltered_html'] = this.unfilteredHtml;
    data['edit_posts'] = this.editPosts;
    data['edit_others_posts'] = this.editOthersPosts;
    data['edit_published_posts'] = this.editPublishedPosts;
    data['publish_posts'] = this.publishPosts;
    data['edit_pages'] = this.editPages;
    data['read'] = this.read;
    data['level_10'] = this.level10;
    data['level_9'] = this.level9;
    data['level_8'] = this.level8;
    data['level_7'] = this.level7;
    data['level_6'] = this.level6;
    data['level_5'] = this.level5;
    data['level_4'] = this.level4;
    data['level_3'] = this.level3;
    data['level_2'] = this.level2;
    data['level_1'] = this.level1;
    data['level_0'] = this.level0;
    data['edit_others_pages'] = this.editOthersPages;
    data['edit_published_pages'] = this.editPublishedPages;
    data['publish_pages'] = this.publishPages;
    data['delete_pages'] = this.deletePages;
    data['delete_others_pages'] = this.deleteOthersPages;
    data['delete_published_pages'] = this.deletePublishedPages;
    data['delete_posts'] = this.deletePosts;
    data['delete_others_posts'] = this.deleteOthersPosts;
    data['delete_published_posts'] = this.deletePublishedPosts;
    data['delete_private_posts'] = this.deletePrivatePosts;
    data['edit_private_posts'] = this.editPrivatePosts;
    data['read_private_posts'] = this.readPrivatePosts;
    data['delete_private_pages'] = this.deletePrivatePages;
    data['edit_private_pages'] = this.editPrivatePages;
    data['read_private_pages'] = this.readPrivatePages;
    data['delete_users'] = this.deleteUsers;
    data['create_users'] = this.createUsers;
    data['unfiltered_upload'] = this.unfilteredUpload;
    data['edit_dashboard'] = this.editDashboard;
    data['update_plugins'] = this.updatePlugins;
    data['delete_plugins'] = this.deletePlugins;
    data['install_plugins'] = this.installPlugins;
    data['update_themes'] = this.updateThemes;
    data['install_themes'] = this.installThemes;
    data['update_core'] = this.updateCore;
    data['list_users'] = this.listUsers;
    data['remove_users'] = this.removeUsers;
    data['promote_users'] = this.promoteUsers;
    data['edit_theme_options'] = this.editThemeOptions;
    data['delete_themes'] = this.deleteThemes;
    data['export'] = this.export;
    data['administrator'] = this.administrator;

    return data;
  }
}

class UserExtraCapabilities {
  bool? administrator;

  UserExtraCapabilities({this.administrator});

  UserExtraCapabilities.fromJson(Map<String, dynamic> json) {
    administrator = json['administrator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['administrator'] = this.administrator;

    return data;
  }
}
