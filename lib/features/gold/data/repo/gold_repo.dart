import 'package:dartz/dartz.dart';
import 'package:metallo/core/network/api_constants.dart';
import 'package:metallo/core/network/dio_helper.dart';
import 'package:metallo/features/gold/data/models/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGold() async {
    try {
      final response = await DioHelper.getData(endPoint: ApiConstants.goldEndPoint);
      return right(GoldModel.fromJson(response.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}