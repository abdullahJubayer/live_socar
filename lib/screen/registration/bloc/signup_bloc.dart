import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/screen/registration/bloc/signup_state.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/response_status.dart';
import '../../../utils/di/inject_module.dart';
import '../data/model/sign_up_request.dart';
import '../data/use_case/registration_usecase.dart';
part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<EmailChanged>((event, emit) =>emit(state.copyWith(isEmailValid: di.get<RegistrationUseCase>().isEmailValid(email: event.email))));
    on<PasswordChanged>((event, emit) => emit(state.copyWith(isPassValid : di.get<RegistrationUseCase>().isPasswordValid(pass: event.pass))));
    on<RegistrationEvent>((event, emit) async{
      emit(state.copyWith(loginUser: BaseResponse(state: ResponseState.loading)));
      var response = await di.get<RegistrationUseCase>().signup(event.request);
      emit(state.copyWith(loginUser : response));
      add(const VerifyEmailEvent());
    });
    on<VerifyEmailEvent>((event, emit) async{
      var response = await di.get<RegistrationUseCase>().verifyEmail();
      print(response);
    },);
  }
}

