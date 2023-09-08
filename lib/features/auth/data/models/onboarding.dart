import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/core/utils/App_strings.dart';

class OnBoardingModel {
  final String img;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.img, required this.title, required this.subTitle});
  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        img: AppAssets.Path2,
        title: AppStrings.onBoardingTitleOne,
        subTitle: AppStrings.onBoardingSubTitleOne),
    OnBoardingModel(
        img: AppAssets.Path3,
        title: AppStrings.onBoardingTitleTwo,
        subTitle: AppStrings.onBoardingSubTitleTwo),
    OnBoardingModel(
        img: AppAssets.Path4,
        title: AppStrings.onBoardingTitleThree,
        subTitle: AppStrings.onBoardingSubTitleThree),
  ];
}
