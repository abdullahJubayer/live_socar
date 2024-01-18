import 'package:equatable/equatable.dart';
import 'package:live_score/screen/point_table/data/model/standing.dart';
import '../../../utils/network/base_response.dart';

class StandingState extends Equatable {
  const StandingState({
    this.standingList
  });

  final BaseResponse<List<StandingResponse>>? standingList;



  StandingState copyWith({
    BaseResponse<List<StandingResponse>>? standingList,
  }) {
    return StandingState(
      standingList: standingList ?? this.standingList,
    );
  }


  @override
  List<Object> get props => [standingList??BaseResponse()];
}