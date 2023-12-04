import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../controllers/AllController.dart';
import '../network/api/user/user_api.dart';
import '../network/dio_client.dart';
import '../repository/user_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));
  getIt.registerSingleton(AllController());
}
