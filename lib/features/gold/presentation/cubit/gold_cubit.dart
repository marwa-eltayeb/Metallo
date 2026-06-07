import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metallo/features/gold/data/repo/gold_repo.dart';
import 'package:metallo/features/gold/presentation/cubit/gold_states.dart';
 
class GoldCubit extends Cubit<GoldStates> {
  final GoldRepo goldRepo;
  GoldCubit(this.goldRepo) : super(InitialState());
 
  Future<void> getGold() async {
    emit(LoadingState());
    final response = await goldRepo.getGold();
    response.fold(
      (error) {
        emit(ErrorState(errMessage: error));
      },
      (goldModel) {
        emit(SuccessState(goldModel: goldModel));
      },
    );
  }
}
 