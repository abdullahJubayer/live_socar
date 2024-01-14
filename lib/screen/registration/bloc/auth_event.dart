part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class EmailChanged extends AuthEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class PasswordChanged extends AuthEvent {
  const PasswordChanged(this.pass);

  final String pass;

  @override
  List<Object> get props => [pass];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.request});
  final SignInRequest request;
}