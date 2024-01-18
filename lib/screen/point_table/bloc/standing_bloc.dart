import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_event.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_state.dart';
import 'package:live_score/screen/dashboard/data/use_case/dashboard_usecase.dart';
import 'package:live_score/screen/point_table/bloc/standing_event.dart';
import 'package:live_score/screen/point_table/bloc/standings_state.dart';
import 'package:live_score/screen/point_table/data/use_case/standing_usecase.dart';
import 'package:live_score/utils/network/base_response.dart';
import '../../../utils/di/inject_module.dart';
import '../../../utils/network/response_status.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  StandingBloc() : super(const StandingState()) {
    on<PointTableEvent>((event, emit) async{
      emit(state.copyWith(standingList: BaseResponse(state: ResponseState.loading)));
      var response = await di.get<StandingUseCase>().getStandings(event.leagueId);
      emit(state.copyWith(standingList: response));
    });
  }
}

