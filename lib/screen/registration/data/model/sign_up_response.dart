import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_up_response.freezed.dart';

@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "pass") String? pass,
  }) = _SignUpResponse;
}
