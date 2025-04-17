import 'package:clean_architecture/Features/home/data/data_sources/local/home_local_data_source_impl.dart';
import 'package:clean_architecture/Features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:clean_architecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:clean_architecture/core/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
setupServiceLocator() {
  locator.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  locator.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource:
          HomeRemoteDataSourceImpl(apiService: locator.get<ApiService>()),
    ),
  );
}
