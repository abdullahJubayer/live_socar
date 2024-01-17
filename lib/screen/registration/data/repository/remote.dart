import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/registration/data/repository/registration_repo.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/error_handler.dart';
import 'package:live_score/utils/network/response_status.dart';
import '../model/sign_up_request.dart';

class RegistrationRemote implements RegistrationRepository {
  @override
  Future<BaseResponse<UserCredential>> createUser(SignUpRequest request) async {
    var response = BaseResponse<UserCredential>();
    try {
      response = BaseResponse(
          statusCode: 200,
          flag: true,
          state: ResponseState.success,
          data: await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: request.email!, password: request.pass!));
    } catch (e) {
      response = ErrorHandler.error(error: e);
    }
    return response;
  }

  @override
  Future<BaseResponse<String>> verifyEmail() async {
    var response = BaseResponse<String>();
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.sendEmailVerification();
        response = BaseResponse(
            statusCode: 200, flag: true, data: "Email verification send");
      } else {
        response = BaseResponse(data: "Email verification failed to send");
      }
    } catch (e) {
      response = ErrorHandler.error(error: e);
    }
    return response;
  }
}
