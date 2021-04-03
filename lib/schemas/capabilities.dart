class Capabilities {
  String? manageTerms;
  String? editTerms;
  String? deleteTerms;
  String? assignTerms;
  String? editPost;
  String? readPost;
  String? deletePost;
  String? editPosts;
  String? editOthersPosts;
  String? publishPosts;
  String? readPrivatePosts;
  String? read;
  String? deletePosts;
  String? deletePrivatePosts;
  String? deletePublishedPosts;
  String? deleteOthersPosts;
  String? editPrivatePosts;
  String? editPublishedPosts;
  String? createPosts;

  Capabilities({
    this.manageTerms,
    this.editTerms,
    this.deleteTerms,
    this.assignTerms,
    this.editPost,
    this.readPost,
    this.deletePost,
    this.editPosts,
    this.editOthersPosts,
    this.publishPosts,
    this.readPrivatePosts,
    this.read,
    this.deletePosts,
    this.deletePrivatePosts,
    this.deletePublishedPosts,
    this.deleteOthersPosts,
    this.editPrivatePosts,
    this.editPublishedPosts,
    this.createPosts,
  });

  Capabilities.fromJson(Map<String, dynamic> json) {
    manageTerms = json['manage_terms'];
    editTerms = json['edit_terms'];
    deleteTerms = json['delete_terms'];
    assignTerms = json['assign_terms'];
    editPost = json['edit_post'];
    readPost = json['read_post'];
    deletePost = json['delete_post'];
    editPosts = json['edit_posts'];
    editOthersPosts = json['edit_others_posts'];
    publishPosts = json['publish_posts'];
    readPrivatePosts = json['read_private_posts'];
    read = json['read'];
    deletePosts = json['delete_posts'];
    deletePrivatePosts = json['delete_private_posts'];
    deletePublishedPosts = json['delete_published_posts'];
    deleteOthersPosts = json['delete_others_posts'];
    editPrivatePosts = json['edit_private_posts'];
    editPublishedPosts = json['edit_published_posts'];
    createPosts = json['create_posts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['manage_terms'] = this.manageTerms;
    data['edit_terms'] = this.editTerms;
    data['delete_terms'] = this.deleteTerms;
    data['assign_terms'] = this.assignTerms;
    data['edit_post'] = this.editPost;
    data['read_post'] = this.readPost;
    data['delete_post'] = this.deletePost;
    data['edit_posts'] = this.editPosts;
    data['edit_others_posts'] = this.editOthersPosts;
    data['publish_posts'] = this.publishPosts;
    data['read_private_posts'] = this.readPrivatePosts;
    data['read'] = this.read;
    data['delete_posts'] = this.deletePosts;
    data['delete_private_posts'] = this.deletePrivatePosts;
    data['delete_published_posts'] = this.deletePublishedPosts;
    data['delete_others_posts'] = this.deleteOthersPosts;
    data['edit_private_posts'] = this.editPrivatePosts;
    data['edit_published_posts'] = this.editPublishedPosts;
    data['create_posts'] = this.createPosts;
    
    return data;
  }
}
