import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/data_sources/home_local_data_source.dart';
import '../../Features/home/data/data_sources/home_remote_data_source.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource:
        HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
    homeLocalDataSource: HomeLocalDataSourceImp(),
  ));
}
