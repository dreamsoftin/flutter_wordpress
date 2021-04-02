class Labels {
  String? name;
  String? singularName;
  String? searchItems;
  String? popularItems;
  String? allItems;
  String? parentItem;
  String? parentItemColon;
  String? addNew;
  String? addNewItem;
  String? editItem;
  String? newItem;
  String? viewItem;
  String? viewItems;
  String? notFound;
  String? notFoundInTrash;
  String? archives;
  String? attributes;
  String? insertIntoItem;
  String? uploadedToThisItem;
  String? featuredImage;
  String? setFeaturedImage;
  String? removeFeaturedImage;
  String? useFeaturedImage;
  String? filterItemsList;
  String? itemsListNavigation;
  String? itemsList;
  String? itemPublished;
  String? itemPublishedPrivately;
  String? itemRevertedToDraft;
  String? itemScheduled;
  String? itemUpdated;
  String? menuName;
  String? nameAdminBar;
  String? updateItem;
  String? newItemName;
  String? separateItemsWithCommas;
  String? addOrRemoveItems;
  String? chooseFromMostUsed;
  String? noTerms;
  String? mostUsed;
  String? backToItems;

  Labels({
    this.name,
    this.singularName,
    this.searchItems,
    this.popularItems,
    this.allItems,
    this.parentItem,
    this.parentItemColon,
    this.addNew,
    this.addNewItem,
    this.editItem,
    this.newItem,
    this.viewItem,
    this.viewItems,
    this.notFound,
    this.notFoundInTrash,
    this.archives,
    this.attributes,
    this.insertIntoItem,
    this.uploadedToThisItem,
    this.featuredImage,
    this.setFeaturedImage,
    this.removeFeaturedImage,
    this.useFeaturedImage,
    this.filterItemsList,
    this.itemsListNavigation,
    this.itemsList,
    this.itemPublished,
    this.itemPublishedPrivately,
    this.itemRevertedToDraft,
    this.itemScheduled,
    this.itemUpdated,
    this.menuName,
    this.nameAdminBar,
    this.updateItem,
    this.newItemName,
    this.separateItemsWithCommas,
    this.addOrRemoveItems,
    this.chooseFromMostUsed,
    this.noTerms,
    this.mostUsed,
    this.backToItems,
  });

  Labels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    singularName = json['singular_name'];
    searchItems = json['search_items'];
    popularItems = json['popular_items'];
    allItems = json['all_items'];
    parentItem = json['parent_item'];
    parentItemColon = json['parent_item_colon'];
    addNew = json['add_new'];
    addNewItem = json['add_new_item'];
    editItem = json['edit_item'];
    newItem = json['new_item'];
    viewItem = json['view_item'];
    viewItems = json['view_items'];
    notFound = json['not_found'];
    notFoundInTrash = json['not_found_in_trash'];
    archives = json['archives'];
    attributes = json['attributes'];
    insertIntoItem = json['insert_into_item'];
    uploadedToThisItem = json['uploaded_to_this_item'];
    featuredImage = json['featured_image'];
    setFeaturedImage = json['set_featured_image'];
    removeFeaturedImage = json['remove_featured_image'];
    useFeaturedImage = json['use_featured_image'];
    filterItemsList = json['filter_items_list'];
    itemsListNavigation = json['items_list_navigation'];
    itemsList = json['items_list'];
    itemPublished = json['item_published'];
    itemPublishedPrivately = json['item_published_privately'];
    itemRevertedToDraft = json['item_reverted_to_draft'];
    itemScheduled = json['item_scheduled'];
    itemUpdated = json['item_updated'];
    menuName = json['menu_name'];
    nameAdminBar = json['name_admin_bar'];
    updateItem = json['update_item'];
    newItemName = json['new_item_name'];
    separateItemsWithCommas = json['separate_items_with_commas'];
    addOrRemoveItems = json['add_or_remove_items'];
    chooseFromMostUsed = json['choose_from_most_used'];
    noTerms = json['no_terms'];
    mostUsed = json['most_used'];
    backToItems = json['back_to_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['name'] = this.name;
    data['singular_name'] = this.singularName;
    data['search_items'] = this.searchItems;
    data['popular_items'] = this.popularItems;
    data['all_items'] = this.allItems;
    data['parent_item'] = this.parentItem;
    data['parent_item_colon'] = this.parentItemColon;
    data['add_new'] = this.addNew;
    data['add_new_item'] = this.addNewItem;
    data['edit_item'] = this.editItem;
    data['new_item'] = this.newItem;
    data['view_item'] = this.viewItem;
    data['view_items'] = this.viewItems;
    data['not_found'] = this.notFound;
    data['not_found_in_trash'] = this.notFoundInTrash;
    data['archives'] = this.archives;
    data['attributes'] = this.attributes;
    data['insert_into_item'] = this.insertIntoItem;
    data['uploaded_to_this_item'] = this.uploadedToThisItem;
    data['featured_image'] = this.featuredImage;
    data['set_featured_image'] = this.setFeaturedImage;
    data['remove_featured_image'] = this.removeFeaturedImage;
    data['use_featured_image'] = this.useFeaturedImage;
    data['filter_items_list'] = this.filterItemsList;
    data['items_list_navigation'] = this.itemsListNavigation;
    data['items_list'] = this.itemsList;
    data['item_published'] = this.itemPublished;
    data['item_published_privately'] = this.itemPublishedPrivately;
    data['item_reverted_to_draft'] = this.itemRevertedToDraft;
    data['item_scheduled'] = this.itemScheduled;
    data['item_updated'] = this.itemUpdated;
    data['menu_name'] = this.menuName;
    data['name_admin_bar'] = this.nameAdminBar;
    data['update_item'] = this.updateItem;
    data['new_item_name'] = this.newItemName;
    data['separate_items_with_commas'] = this.separateItemsWithCommas;
    data['add_or_remove_items'] = this.addOrRemoveItems;
    data['choose_from_most_used'] = this.chooseFromMostUsed;
    data['no_terms'] = this.noTerms;
    data['most_used'] = this.mostUsed;
    data['back_to_items'] = this.backToItems;

    return data;
  }
}
