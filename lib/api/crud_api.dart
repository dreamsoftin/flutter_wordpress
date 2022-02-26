import 'package:flutter_wordpress/api/wp_api.dart';
import 'package:meta/meta.dart';

import '../requests/delete/base_delete_param.dart';
import '../utils/request/data_sanitizer.dart';

mixin CRUDHelper<T, CREATE_PARAM,FILTER_PARAM, DELETE_PARAM extends DeleteParams> on WPApi {
  final DataSanitizerUtil _sanitizerUtil = const DataSanitizerUtil();
  @protected
  ///
  /// ## [toJson] is a internal method and should not be used.
  ///
  Map<String, dynamic> toJson(CREATE_PARAM data);
  @protected
  Map<String, dynamic> paramtoJson(FILTER_PARAM data);
  @protected
  T decode(data);

  Future<T> create({required CREATE_PARAM data}) async {
    var map = toJson(data);

    _sanitizerUtil.removeNullFromMap(map);

    final response = await post(map);

    return decode(response);
  }

  Future<T> update({required int id, required CREATE_PARAM data}) async {
    var map = toJson(data);

    _sanitizerUtil.removeNullFromMap(map);

    final response = await post(map, subPath: "$path/$id");

    return decode(response);
  }

  Future<List<T>> fetch({
    required FILTER_PARAM params,
  }) async {
    var map = paramtoJson(params);
    _sanitizerUtil.removeNullFromMap(map);
    map.removeWhere((key, value) => value.isEmpty);
    final data = await get<T>(
      map,
      decode: decode,
    );

    return data;
  }

  Future<void> delete({required DELETE_PARAM params}) async {
    await deleteR(params.id, params.toMap());
  }
}

