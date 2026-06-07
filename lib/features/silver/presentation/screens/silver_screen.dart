import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metallo/core/constants/app_colors.dart';
import 'package:metallo/core/constants/app_strings.dart';
import 'package:metallo/core/constants/app_images.dart';
import 'package:metallo/core/widgets/custom_text.dart';
import 'package:metallo/features/silver/presentation/cubit/silver_states.dart';
import 'package:metallo/features/silver/data/repo/silver_repo.dart';
import 'package:metallo/features/silver/presentation/cubit/silver_cubit.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SilverCubit(SilverRepo())..getSilver();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Text(
            AppStrings.silverTracker,
            style: TextStyle(
              color: AppColors.silverColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ), // TextStyle
          ), // Text
        ), // AppBar
        body: BlocBuilder<SilverCubit, SilverStates>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator(color: Colors.white));
            } else if (state is ErrorState) {
              return Center(child: Text(state.errMessage, style: TextStyle(color: Colors.white)));
            } else if (state is SuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.silverBar, width: 200, height: 250),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: state.silverModel.price.toString(),
                        color: AppColors.silverColor,
                      ),
                      SizedBox(width: 3),
                      CustomText(
                        text: state.silverModel.currency,
                        color: AppColors.silverColor,
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
