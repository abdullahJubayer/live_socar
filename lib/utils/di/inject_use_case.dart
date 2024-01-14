import '../../screen/registration/data/use_case/registration_usecase.dart';
import 'inject_module.dart';

Future<void> setupUseCaseModule() async {
  di.registerLazySingleton<RegistrationUseCase>(() => RegistrationUseCase(repository: di()),);
}
