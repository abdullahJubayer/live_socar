import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_request.freezed.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "pass") String? pass,
  }) = _LoginRequest;
}
