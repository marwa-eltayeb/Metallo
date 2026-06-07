import 'package:metallo/features/silver/data/models/silver_model.dart';
 
abstract class SilverStates {}
 
class InitialState extends SilverStates {}
 
class ErrorState extends SilverStates {
  final String errMessage;
  ErrorState({required this.errMessage});
}
 
class SuccessState extends SilverStates {
  final SilverModel silverModel;
  SuccessState({required this.silverModel});
}
 
class LoadingState extends SilverStates {}
 