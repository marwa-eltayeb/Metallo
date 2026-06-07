import 'package:dartz/dartz.dart';
import 'package:metallo/core/network/api_constants.dart';
import 'package:metallo/core/network/dio_helper.dart';
import 'package:metallo/features/silver/data/models/silver_model.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilver() async {
    try {
      final response = await DioHelper.getData(endPoint: ApiConstants.sliverEndPoint);
      return right(SilverModel.fromJson(response.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}