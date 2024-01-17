import 'package:equatable/equatable.dart';
import 'package:live_score/screen/dashboard/data/model/fixtures_response.dart';
import '../../../utils/network/base_response.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.fixtureList
  });

  final BaseResponse<List<FixturesResponse>>? fixtureList;



  DashboardState copyWith({
    BaseResponse<List<FixturesResponse>>? fixtureList,
  }) {
    return DashboardState(
      fixtureList: fixtureList ?? this.fixtureList,
    );
  }


  @override
  List<Object> get props => [fixtureList??BaseResponse()];
}