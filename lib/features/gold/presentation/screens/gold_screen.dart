import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metallo/core/constants/app_colors.dart';
import 'package:metallo/core/constants/app_strings.dart';
import 'package:metallo/core/constants/app_images.dart';
import 'package:metallo/core/widgets/custom_text.dart';
import 'package:metallo/features/gold/data/repo/gold_repo.dart';
import 'package:metallo/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:metallo/features/gold/presentation/cubit/gold_states.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GoldCubit(GoldRepo())..getGold();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Text(
            AppStrings.goldTracker,
            style: TextStyle(
              color: AppColors.goldColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ), // TextStyle
          ), // Text
        ), // AppBar
        body: BlocBuilder<GoldCubit, GoldStates>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator(color: Colors.white));
            } else if (state is ErrorState) {
              return Center(child: Text(state.errMessage, style: TextStyle(color: Colors.white)));
            } else if (state is SuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.goldBar, width: 200, height: 250),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: state.goldModel.price.toString(),
                        color: AppColors.goldColor,
                      ),
                      SizedBox(width: 3),
                      CustomText(
                        text: state.goldModel.currency,
                        color: AppColors.goldColor,
                      ),
                    ],
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
