part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

final class EmailChanged extends SignupEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class PasswordChanged extends SignupEvent {
  const PasswordChanged(this.pass);

  final String pass;

  @override
  List<Object> get props => [pass];
}

class RegistrationEvent extends SignupEvent {
  const RegistrationEvent({required this.request});
  final SignUpRequest request;
}

class VerifyEmailEvent extends SignupEvent {
  const VerifyEmailEvent();
}