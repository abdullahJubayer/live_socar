import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_in_request.freezed.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "pass") String? pass,
  }) = _SignInRequest;
}
