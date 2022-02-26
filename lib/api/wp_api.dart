import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress/utils/request/request.dart';
import 'package:meta/meta.dart';

abstract class WPApi {
  final String _baseUrl;

  final Map<String, dynamic> headers;
  WPRequest get request => WPRequest(_baseUrl, headers);

  const WPApi(this._baseUrl, this.headers);

  String get path;
  @protected

  ///
  /// ## [get] is a internal method and should not be used.
  ///
  Future<List<T>> get<T>(Map<String, dynamic> queryParam,
      {T Function(Map<String, dynamic> value)? decode, String? subPath}) async {
    try {
      final response =
          await request.get(subPath ?? path, queryParams: queryParam);
      List<T> decoded = [];
      for (var item in response.body) {
        decoded.add(decode?.call(item) ?? item);
      }
      return decoded;
    } catch (e) {
      //TODO: Imporove Error handling
      throw new WordPressError(message: e.toString());
    }
  }

  @protected

  ///
  /// ## [post] is a internal method and should not be used.
  ///
  Future<dynamic> post<T>(Map<String, dynamic> body, {String? subPath}) async {
    try {
      final response = await request.post(
        subPath ?? path,
        body,
      );
      return response.body;
    } catch (e) {
      //TODO: Imporove Error handling
      throw new WordPressError(message: e.toString());
    }
  }

  @protected

  ///
  /// ## [deleteR] is a internal method and should not be used.
  ///
  Future<dynamic> deleteR(
    int id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await request.delete(path + "/$id", body);
      return response.body;
    } catch (e) {
      //TODO: Imporove Error handling
      throw new WordPressError(message: e.toString());
    }
  }
}
