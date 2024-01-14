import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/registration/data/repository/registration_repo.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/error_handler.dart';
import '../model/sign_in_request.dart';

class RegistrationRemote implements RegistrationRepository{

  @override
  Future<BaseResponse<UserCredential>> createUser(SignInRequest request) async{
     var response = BaseResponse<UserCredential>();
     try{
          response = BaseResponse(statusCode: 200,flag: true,data : await FirebaseAuth.instance.createUserWithEmailAndPassword(email: request.email!, password: request.pass!));
     }catch(e){
       response = ErrorHandler.error(error: e);
     }
     return response;
  }

}