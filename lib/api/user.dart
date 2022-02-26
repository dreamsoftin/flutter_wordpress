import 'package:flutter_wordpress/api/crud_api.dart';
import 'package:flutter_wordpress/api/wp_api.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress/requests/delete/base_delete_param.dart';
import 'package:flutter_wordpress/utils/request/data_sanitizer.dart';

class UserAPI extends WPApi
    with CRUDHelper<User,User, ParamsUserList, DeleteParams> {
  UserAPI(String baseUrl, Map<String, dynamic> headers)
      : super(baseUrl, headers);

  User decode(data) {
    return User.fromJson(data);
  }

  @override
  String get path => URL_USERS;

  @override
  Map<String, dynamic> paramtoJson(ParamsUserList data) {
    return data.toMap();
  }

  @override
  Map<String, dynamic> toJson(User data) {
    return data.toJson();
  }

  Future<User> fetchMe() async {
    final response = await request.get(URL_USER_ME);

    Map<String, dynamic> jsonStr = response.body;

    if (jsonStr.length == 0)
      throw new WordPressError(code: 'wp_empty_user', message: "No user found");
    return User.fromJson(jsonStr);
  }
Future<List<User>> fetchCustomUser({
    required ParamsUserList params,
    required String path,
  }) async {
    var map = paramtoJson(params);
    DataSanitizerUtil().removeNullFromMap(map);
    map.removeWhere((key, value) => value.isEmpty);
    final users = await get<User>(
      map,
      decode: decode,
      subPath: path
    );

    return users;
  }

}
