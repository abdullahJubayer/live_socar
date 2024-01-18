import 'package:live_score/screen/point_table/data/model/standing.dart';
import 'package:live_score/screen/point_table/data/repository/standings_repo.dart';
import '../../../../utils/network/base_response.dart';

class StandingUseCase{
  StandingUseCase({required StandingsRepository repository}) : _repository = repository;
  final _repository;


  Future<BaseResponse<List<StandingResponse>>> getStandings(int leagueId) async{
    return _repository.getStandings(leagueId);
  }
}