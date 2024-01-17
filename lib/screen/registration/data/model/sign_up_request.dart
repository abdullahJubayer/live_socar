import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_up_request.freezed.dart';

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "pass") String? pass,
  }) = _SignUpRequest;
}
