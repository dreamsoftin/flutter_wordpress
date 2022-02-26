import 'package:flutter_wordpress/api/wp_api.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress/requests/delete/base_delete_param.dart';

import 'crud_api.dart';

class MediasAPI extends WPApi
    with CRUDHelper<Media,Media, ParamsMediaList, DeleteParams> {
  MediasAPI(String baseUrl, Map<String, dynamic> headers)
      : super(baseUrl, headers);

  @override
  Media decode(data) {
    return Media.fromJson(data);
  }

  @override
  Future<Media> create({required Media data,}) {
    // TODO: implement create
    return super.create(data:data);
  }

  @override
  Map<String, dynamic> paramtoJson(ParamsMediaList data) {
    return data.toMap();
  }

  @override
  String get path => URL_MEDIA;

  @override
  Map<String, dynamic> toJson(Media data) {
    return data.toJson();
  }
}
