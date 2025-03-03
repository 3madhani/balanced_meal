import 'package:balanced_meal/Features/food_order/data/repo/food_repository_impl.dart';
import 'package:balanced_meal/core/utils/api_services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<FoodRepositoryImpl>(
    FoodRepositoryImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
