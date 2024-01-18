import 'package:live_score/screen/dashboard/data/model/fixtures_response.dart';
import 'package:live_score/screen/dashboard/data/repository/dashboard_repo.dart';
import 'package:live_score/utils/network/api_client.dart';
import 'package:live_score/utils/network/base_response.dart';
import 'package:live_score/utils/network/response_status.dart';
import '../../../../utils/network/error_handler.dart';
import '../model/fixtures_request.dart';

class DashboardRemoteDao implements DashboardRepository{
  final RestClient restClient;
  DashboardRemoteDao({required this.restClient});


  @override
  Future<BaseResponse<List<FixturesResponse>>> getFixtures(FixturesRequest request) async{
    var response = BaseResponse<List<FixturesResponse>>();
    try{
      var result = await restClient.getFixtures('get_events',request.fromDate!,request.toDate!,request.league_id!);
      List<FixturesResponse> fixture = List<FixturesResponse>.from(result.map((model)=> FixturesResponse.fromJson(model)));
      response = BaseResponse<List<FixturesResponse>>(data: fixture,statusCode: 200,flag: true,state: ResponseState.success);
    }catch(e){
    response = ErrorHandler.error(error: e);
    }
    return response;
  }


}