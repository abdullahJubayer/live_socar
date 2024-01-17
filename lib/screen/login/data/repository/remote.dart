import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/error_handler.dart';
import '../model/login_request.dart';
import 'login_repo.dart';

class LoginRemoteDao implements LoginRepository{

  @override
  Future<BaseResponse<UserCredential>> login(LoginRequest request) async{
     var response = BaseResponse<UserCredential>();
     try{
          response = BaseResponse(statusCode: 200,flag: true,data : await FirebaseAuth.instance.createUserWithEmailAndPassword(email: request.email!, password: request.pass!));
     }catch(e){
       response = ErrorHandler.error(error: e);
     }
     return response;
  }

}