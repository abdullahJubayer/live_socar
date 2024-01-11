import 'package:dio/dio.dart';

import 'dart:developer' as logdev;

import 'base_response.dart';

class ErrorHandler {
  static BaseResponse<T> error<T>({Object? error, StackTrace? stackTrace}) {
    logdev.log(error.toString());
    logdev.log(stackTrace.toString());

    switch (error.runtimeType) {
      case DioException:
        final res = (error as DioException).response;
        var message = res?.data['message']??res?.data['msg'];
        var newResponse = BaseResponse<T>(
          flag: false,
          statusCode: res?.statusCode ?? 404,
          message: message ?? res?.statusMessage ?? '',
        );
        return newResponse;

      default:
        return BaseResponse<T>(
          message: 'Something wrong!',
          statusCode: 404,
          flag: false,
        );
    }
  }
}
