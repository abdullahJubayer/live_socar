import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_score/screen/dashboard/data/model/fixtures_response.dart';
import 'package:live_score/screen/dashboard/data/repository/dashboard_repo.dart';
import 'package:live_score/screen/login/data/model/login_request.dart';
import 'package:live_score/screen/login/data/repository/login_repo.dart';
import '../../../../utils/network/base_response.dart';
import '../model/fixtures_request.dart';

class DashboardUseCase{
  DashboardUseCase({required DashboardRepository repository}) : _repository = repository;
  final _repository;


  Future<BaseResponse<List<FixturesResponse>>> getFixtures(FixturesRequest request) async{
    return _repository.getFixtures(request);
  }
}