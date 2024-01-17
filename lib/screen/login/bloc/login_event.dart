import 'package:equatable/equatable.dart';
import '../data/model/login_request.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

final class EmailChanged extends SignInEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class PasswordChanged extends SignInEvent {
  const PasswordChanged(this.pass);

  final String pass;

  @override
  List<Object> get props => [pass];
}


class Login extends SignInEvent {
  const Login({required this.request});
  final LoginRequest request;
}