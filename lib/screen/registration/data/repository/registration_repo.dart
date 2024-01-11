import '../../../../utils/network/base_response.dart';

abstract class RegistrationRepository {
  Future<BaseResponse<dynamic>> createUser(Map<String, dynamic> map);
}