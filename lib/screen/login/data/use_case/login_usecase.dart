import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/login/data/repository/login_repo.dart';
import '../../../../utils/network/base_response.dart';
import '../model/login_request.dart';

class LoginUseCase{
  LoginUseCase({required LoginRepository repository}) : _repository = repository;
  final _repository;


  Future<BaseResponse<UserCredential>> login(LoginRequest request) async{
    return _repository.login(request);
  }

  bool isEmailValid({required String email}){
    return email.isNotEmpty;
  }

  bool isPasswordValid({required String pass}){
    return pass.isNotEmpty && pass.length >= 6;
  }
}