import 'package:live_score/screen/dashboard/data/repository/dashboard_repo.dart';
import 'package:live_score/screen/dashboard/data/repository/remote.dart';
import 'package:live_score/screen/registration/data/repository/registration_repo.dart';
import '../../screen/registration/data/repository/remote.dart';
import 'inject_module.dart';

Future<void> setupRepositoryModule() async {
  di.registerLazySingleton<RegistrationRepository>(() => RegistrationRemote());
  di.registerLazySingleton<DashboardRepository>(() => DashboardRemoteDao(restClient: di()));

}
