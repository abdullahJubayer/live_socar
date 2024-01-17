import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/login/data/model/login_request.dart';

import '../../../../utils/network/base_response.dart';

abstract class LoginRepository {
  Future<BaseResponse<UserCredential>> login(LoginRequest request);
}