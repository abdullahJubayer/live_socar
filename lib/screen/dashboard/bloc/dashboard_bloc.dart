import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_event.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_state.dart';
import 'package:live_score/screen/dashboard/data/use_case/dashboard_usecase.dart';
import 'package:live_score/utils/network/base_response.dart';
import '../../../utils/di/inject_module.dart';
import '../../../utils/network/response_status.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<FixtureEvent>((event, emit) async{
      emit(state.copyWith(fixtureList: BaseResponse(state: ResponseState.loading)));
      var response = await di.get<DashboardUseCase>().getFixtures(event.request);
      emit(state.copyWith(fixtureList: response));
    });
  }
}

