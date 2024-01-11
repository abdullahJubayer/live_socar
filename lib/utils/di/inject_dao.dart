import 'package:dio/dio.dart';
import '../network/api_client.dart';
import '../network/dio_client.dart';
import '../network/interceptors.dart';
import '../storage/shared_pref/shared_pref.dart';
import 'inject_module.dart';

Future<void> setupDaoModule() async {
  di.registerLazySingleton<SharedPreference>(() => SharedPreference());

  di.registerLazySingleton<RestClient>(
    () => RestClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: 'Base url',
        ),
      )..interceptors.add(
          CustomInterceptors(
            sharePref: di(),
          ),
        ),
    ),
  );

  di.registerLazySingleton<DioClient>(
    () => DioClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: 'Base url',
        ),
      )..interceptors.add(
          CustomInterceptors(
            sharePref: di(),
          ),
        ),
    ),
  );
}
