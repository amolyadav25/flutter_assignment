import 'package:dio/dio.dart';
import 'package:flutter_assignment/features/customer/data/datasource/user_remote_data_source.dart';
import 'package:flutter_assignment/features/customer/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/api_client.dart';
import 'features/customer/data/repository/user_repository_impl.dart';
import 'features/customer/domain/user_case/get_users_use_case.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(ApiClient(getIt<Dio>()));
  getIt.registerSingleton(UserRemoteDataSource(getIt<ApiClient>()));
  getIt.registerSingleton(UserRepositoryImpl(getIt<UserRemoteDataSource>()));
  getIt.registerSingleton(
    GetUsersUseCase(userRepository: getIt<UserRepositoryImpl>()),
  );

  getIt.registerSingleton(UserBloc(getUsersUseCase: getIt<GetUsersUseCase>()));
}
