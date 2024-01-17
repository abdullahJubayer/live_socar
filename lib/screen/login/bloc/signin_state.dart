import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/utils/network/base_response.dart';

class SignInState extends Equatable {
  const SignInState({
    this.isEmailValid = false,
    this.isPassValid = false,
    this.loginUser
  });

  final BaseResponse<UserCredential>? loginUser;
  final bool isEmailValid;
  final bool isPassValid;


  SignInState copyWith({
    bool? isEmailValid,
    bool? isPassValid,
    BaseResponse<UserCredential>? loginUser,
  }) {
    return SignInState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPassValid: isPassValid ?? this.isPassValid,
      loginUser: loginUser ?? this.loginUser,
    );
  }


  @override
  List<Object> get props => [loginUser??BaseResponse(),isEmailValid, isPassValid];
}