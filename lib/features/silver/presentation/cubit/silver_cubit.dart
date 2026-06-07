import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metallo/features/silver/data/repo/silver_repo.dart';
import 'package:metallo/features/silver/presentation/cubit/silver_states.dart';

class SilverCubit extends Cubit<SilverStates> {
  final SilverRepo silverRepo;
  SilverCubit(this.silverRepo) : super(InitialState());
 
  Future<void> getSilver() async {
    emit(LoadingState());
    final response = await silverRepo.getSilver();
    response.fold(
      (error) {
        emit(ErrorState(errMessage: error));
      },
      (silverModel) {
        emit(SuccessState(silverModel: silverModel));
      },
    );
  }
}
 