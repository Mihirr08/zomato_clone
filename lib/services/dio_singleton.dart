import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio = Dio();

  Future<Response> getMethod(
      {required String baseUrl,
      required String endPoint,
      Map<String, dynamic>? queryParam}) async {
    Response response =
        await _dio.get(baseUrl + endPoint, queryParameters: queryParam);
    return response;
  }

  Future<Response> postMethod(
      {required String baseUrl,
      required String endPoint,
      Map<String, dynamic>? queryParam,
      Object? body}) async {
    Response response = await _dio.post(baseUrl + endPoint,
        queryParameters: queryParam, data: body);
    return response;
  }
}
