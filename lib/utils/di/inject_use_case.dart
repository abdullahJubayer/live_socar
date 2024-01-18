import 'package:live_score/screen/dashboard/data/use_case/dashboard_usecase.dart';
import 'package:live_score/screen/point_table/data/use_case/standing_usecase.dart';

import '../../screen/registration/data/use_case/registration_usecase.dart';
import 'inject_module.dart';

Future<void> setupUseCaseModule() async {
  di.registerLazySingleton<RegistrationUseCase>(() => RegistrationUseCase(repository: di()),);
  di.registerLazySingleton<DashboardUseCase>(() => DashboardUseCase(repository: di()),);
  di.registerLazySingleton<StandingUseCase>(() => StandingUseCase(repository: di()),);
}
