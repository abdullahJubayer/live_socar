import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:developer' as logdev;

import 'package:live_score/utils/storage/shared_pref/shared_pref.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors({required SharedPreference sharePref,}) : _sharePref = sharePref;

  final SharedPreference _sharePref;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = _sharePref.getToken();
    if (token != null) {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      });
    }

    logdev.log(
        'url: ${options.baseUrl}${options.path} headers: ${options.headers}  Q: ${options.queryParameters} Data: ${options.data}');
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logdev.log(err.toString());
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data as Map;
    data.putIfAbsent('status', () => response.statusCode);
    response.data = data;

    logdev.log('${response.realUri} ## ${jsonEncode(response.data)}');
    return handler.next(response);
  }
}
