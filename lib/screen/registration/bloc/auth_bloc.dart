import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/screen/registration/data/model/sign_in_request.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/response_status.dart';
import 'package:live_score/utils/response.dart';
import '../../../utils/di/inject_module.dart';
import '../data/use_case/registration_usecase.dart';
part 'auth_event.dart';

class EmailBloc extends Bloc<AuthEvent, ResponseState<bool>> {
  EmailBloc() : super(const ResponseState()) {
    on<EmailChanged>((event, emit) =>emit(state.copyWith(state: Status.success,data: di.get<RegistrationUseCase>().isEmailValid(email: event.email))));
  }
}

class PassBloc extends Bloc<AuthEvent, ResponseState<bool>> {
  PassBloc() : super(const ResponseState()) {
    on<PasswordChanged>((event, emit) => emit(state.copyWith(state: Status.success,data: di.get<RegistrationUseCase>().isPasswordValid(pass: event.pass))));
  }
}

class SignupBloc extends Bloc<AuthEvent, ResponseState<BaseResponse<UserCredential>>> {
  SignupBloc() : super(const ResponseState()) {
    on<LoginEvent>((event, emit) async{
      emit(state.copyWith(state: Status.loading));
      var response = await di.get<RegistrationUseCase>().signup(event.request);
      emit(state.copyWith(state: response.type ,data: response));
    });
  }
}

