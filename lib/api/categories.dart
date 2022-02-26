import 'package:flutter_wordpress/api/wp_api.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress/requests/delete/base_delete_param.dart';

import 'crud_api.dart';

class CategoriesAPI extends WPApi with CRUDHelper<Category,Category,ParamsCategoryList,DeleteParams>{
  CategoriesAPI(String baseUrl, Map<String, dynamic> headers) : super(baseUrl, headers);

  @override
  Category decode(data) {
   return Category.fromJson(data);
  }

  @override
  Map<String, dynamic> paramtoJson(ParamsCategoryList data) {
    return data.toMap();
  }

  @override
  String get path => URL_CATEGORIES;

  @override
  Map<String, dynamic> toJson(Category data) {
    return data.toJson();
  }

}