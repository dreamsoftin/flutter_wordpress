import 'package:dio/dio.dart';

part 'response.dart';

class WPRequest {
  late final Dio _dio;

  WPRequest(String server, Map<String, dynamic> headers) {
    _dio = Dio(BaseOptions(baseUrl: server, headers: headers));
  }

  Future<WPResponse> get(
    String endPoint, {
    Map<String, dynamic> queryParams = const {},
  }) async {
    final response = await _dio.get(endPoint, queryParameters: queryParams);

    return WPResponse(headder: response.headers.map, body: response.data);
  }

  Future<WPResponse> post(
    String endPoint,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.post(endPoint, data: body);

    return WPResponse(headder: response.headers.map, body: response.data);
  }

  Future<WPResponse> delete(
    String endPoint,
    Map<String,dynamic> data
  ) async {
    final response = await _dio.delete(
      endPoint,
      data: data
    );

    return WPResponse(headder: response.headers.map, body: response.data);
  }
}
