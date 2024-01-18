import 'package:live_score/screen/point_table/data/model/standing.dart';

import '../../../../utils/network/base_response.dart';

abstract class StandingsRepository {
  Future<BaseResponse<List<StandingResponse>>> getStandings(int leagueId);
}