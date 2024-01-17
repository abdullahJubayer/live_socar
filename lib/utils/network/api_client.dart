import 'package:dio/dio.dart';
import 'package:live_score/screen/dashboard/data/model/fixtures_request.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../screen/dashboard/data/model/fixtures_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('')
  Future<dynamic> getFixtures(@Query('from') String fromDate,@Query('to')String toDate,@Query('league_id') int leagueId);
}
