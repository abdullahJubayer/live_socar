import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/registration/data/model/sign_in_request.dart';

import '../../../../utils/network/base_response.dart';

abstract class RegistrationRepository {
  Future<BaseResponse<UserCredential>> createUser(SignInRequest request);
}