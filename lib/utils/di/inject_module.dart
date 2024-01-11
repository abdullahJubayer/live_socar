import 'package:get_it/get_it.dart';
import 'inject_dao.dart';
import 'inject_repository.dart';
import 'inject_use_case.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  await setupDaoModule();
  await setupRepositoryModule();
  await setupUseCaseModule();
}
