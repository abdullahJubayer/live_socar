import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/screen/login/bloc/login_event.dart';
import 'package:live_score/screen/login/bloc/signin_state.dart';
import 'package:live_score/screen/login/data/use_case/login_usecase.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/response_status.dart';
import '../../../utils/di/inject_module.dart';
import '../../dashboard/data/use_case/dashboard_usecase.dart';
import '../../registration/data/use_case/registration_usecase.dart';


class LoginBloc extends Bloc<SignInEvent, SignInState> {
  LoginBloc() : super(const SignInState()) {
    on<EmailChanged>((event, emit) =>emit(state.copyWith(isEmailValid: di.get<RegistrationUseCase>().isEmailValid(email: event.email))));
    on<PasswordChanged>((event, emit) => emit(state.copyWith(isPassValid : di.get<RegistrationUseCase>().isPasswordValid(pass: event.pass))));
    on<Login>((event, emit) async{
      emit(state.copyWith(loginUser: BaseResponse(state: ResponseState.loading)));
      var response = await di.get<LoginUseCase>().login(event.request);
      emit(state.copyWith(loginUser: response));
    });
  }
}

