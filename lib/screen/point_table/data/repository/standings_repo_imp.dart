import 'package:live_score/screen/point_table/data/model/standing.dart';
import 'package:live_score/screen/point_table/data/repository/standings_repo.dart';

import '../../../../utils/network/api_client.dart';
import '../../../../utils/network/base_response.dart';
import '../../../../utils/network/error_handler.dart';
import '../../../../utils/network/response_status.dart';

class StandingsRemoteDao implements StandingsRepository{
  final RestClient restClient;
  StandingsRemoteDao({required this.restClient});


  @override
  Future<BaseResponse<List<StandingResponse>>> getStandings(int leagueId) async{
    var response = BaseResponse<List<StandingResponse>>();
    try{
      var result = await restClient.getStandings(leagueId,'get_standings');
      List<StandingResponse> standings = List<StandingResponse>.from(result.map((model)=> StandingResponse.fromJson(model)));
      response = BaseResponse<List<StandingResponse>>(data: standings,statusCode: 200,flag: true,state: ResponseState.success);
    }catch(e){
      response = ErrorHandler.error(error: e);
    }
    return response;
  }


}