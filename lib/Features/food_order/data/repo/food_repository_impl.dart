import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:balanced_meal/Features/food_order/data/repo/food_repository.dart';
import 'package:balanced_meal/core/constants/apis_links.dart';
import 'package:balanced_meal/core/errors/failure.dart';
import 'package:balanced_meal/core/utils/api_services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FoodRepositoryImpl implements FoodRepository {
  final ApiServices apiServices;
  FoodRepositoryImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<MealModel>>> getCarbs() async {
    try {
      var data = await apiServices.get(url: ApisLinks.carbsApi);

      List<MealModel> carbs = [];
      for (var i = 0; i < data.data.length; i++) {
        carbs.add(MealModel.fromJson(data.data[i]));
      }
      return Right(carbs);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(
          errMessage: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> getMeat() async {
    try {
      var data = await apiServices.get(url: ApisLinks.meatApi);

      List<MealModel> meat = [];
      for (var i = 0; i < data.data.length; i++) {
        meat.add(MealModel.fromJson(data.data[i]));
      }
      return Right(meat);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(
          errMessage: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> getVegetables() async {
    try {
      var data = await apiServices.get(url: ApisLinks.vegetablesApi);

      List<MealModel> vegetables = [];
      for (var i = 0; i < data.data.length; i++) {
        vegetables.add(MealModel.fromJson(data.data[i]));
      }
      return Right(vegetables);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(
          errMessage: e.toString(),
        ));
      }
    }
  }
}
