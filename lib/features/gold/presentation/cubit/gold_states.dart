import 'package:metallo/features/gold/data/models/gold_model.dart';
 
abstract class GoldStates {}
 
class InitialState extends GoldStates {}
 
class ErrorState extends GoldStates {
  final String errMessage;
  ErrorState({required this.errMessage});
}
 
class SuccessState extends GoldStates {
  final GoldModel goldModel;
  SuccessState({required this.goldModel});
}
 
class LoadingState extends GoldStates {}
 