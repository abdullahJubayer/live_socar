import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:developer' as logdev;

import 'base_response.dart';

class ErrorHandler {
  static BaseResponse<T> error<T>({Object? error}) {
    logdev.log(error.toString());

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

      case FirebaseAuthException :
        return BaseResponse<T>(
          flag: false,
          statusCode: 404,
          message: (error as FirebaseAuthException).code == 'weak-password' ? 'The password provided is too weak.':  (error).code == 'email-already-in-use' ? 'The account already exists for that email.' : '',
        );

    default:
        return BaseResponse<T>(
          message: 'Something wrong!',
          statusCode: 404,
          flag: false,
        );
    }
  }
}
