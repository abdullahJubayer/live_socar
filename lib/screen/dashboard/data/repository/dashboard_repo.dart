import '../../../../utils/network/base_response.dart';
import '../model/fixtures_request.dart';
import '../model/fixtures_response.dart';

abstract class DashboardRepository {
  Future<BaseResponse<List<FixturesResponse>>> getFixtures(FixturesRequest request);
}