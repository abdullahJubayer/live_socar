import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import 'package:live_score/utils/network/response_state.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({
    this.data,
    this.statusCode = 404,
    this.message = '',
    this.flag = false,
  });

  @JsonKey(name: 'data')
  T? data;
  String message;
  int statusCode;
  bool flag;

  ApiState get type {
    if (statusCode == 200 && flag) {
      return ApiState.success;
    } else {
      return ApiState.error;
    }
  }

  BaseResponse copyWith({
    T? data,
    String? message,
    int? statusCode,
    bool? flag,
  }) {
    return BaseResponse(
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      flag: flag ?? this.flag,
    );
  }

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(dynamic) create) {
    return BaseResponse(
      message: json['message'] ?? json['msg'] ?? '',
      flag: json['flag'] is int
          ? (json['flag'] == 1 ? true : false)
          : (json['flag'] ?? false),
      statusCode: json['status'] ?? 404,
      data: json['data'] == null ? null : create(json['data']),
    );
  }

  Map<String, dynamic> toJson() =>
      {"message": message, "status": statusCode, "data": data};
}
