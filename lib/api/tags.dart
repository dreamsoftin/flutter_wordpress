import 'package:flutter_wordpress/api/wp_api.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress/requests/delete/base_delete_param.dart';

import 'crud_api.dart';

class TagsAPI extends WPApi with CRUDHelper<Tag,Tag,ParamsTagList,DeleteParams>{
  TagsAPI(String baseUrl, Map<String, dynamic> headers) : super(baseUrl, headers);

  @override
  Tag decode(data) {
   return Tag.fromJson(data);
  }

  @override
  Map<String, dynamic> paramtoJson(ParamsTagList data) {
    return data.toMap();
  }

  @override
  String get path => URL_TAGS;

  @override
  Map<String, dynamic> toJson(Tag data) {
    return data.toJson();
  }

}