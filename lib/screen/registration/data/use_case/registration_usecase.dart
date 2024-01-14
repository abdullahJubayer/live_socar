import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/registration/data/repository/registration_repo.dart';
import '../../../../utils/network/base_response.dart';
import '../model/sign_in_request.dart';

class RegistrationUseCase{
  RegistrationUseCase({required RegistrationRepository repository}) : _repository = repository;
  final _repository;


  Future<BaseResponse<UserCredential>> signup(SignInRequest request) async{
    return _repository.createUser(request);
  }

  bool isEmailValid({required String email}){
    return email.isNotEmpty;
  }

  bool isPasswordValid({required String pass}){
    return pass.isNotEmpty && pass.length >= 6;
  }
}