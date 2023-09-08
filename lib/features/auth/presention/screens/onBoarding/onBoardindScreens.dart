import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/common/commonds.dart';
import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/core/widgeths/custom_elevated_button.dart';
import 'package:to_do_app/core/widgeths/custom_text_button.dart';
import 'package:to_do_app/features/Task/screens/home.dart';
import '../../../../../core/datebase/cache.dart';
import '../../../../../core/services/services_Locator.dart';
import '../../../../../core/utils/App_colors.dart';
import '../../../../../core/utils/App_strings.dart';
import '../../../data/models/onboarding.dart';

class onBoardingScreens extends StatelessWidget {
  onBoardingScreens({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: OnBoardingModel.onBoardingScreens.length,
                    controller: controller,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              index != 2
                                  ? CustomTextButton(
                                      text: AppStrings.skip,
                                      Onpressed: () {
                                        controller.jumpToPage(2);
                                      },
                                    )
                                  : const SizedBox(
                                      height: 50,
                                    ),
                            ],
                          ),
                          Image.asset(
                              OnBoardingModel.onBoardingScreens[index].img),
                          const SizedBox(
                            height: 16,
                          ),
                          SmoothPageIndicator(
                            controller: controller,
                            count: OnBoardingModel.onBoardingScreens.length,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: AppColors.primarycolor,
                              radius: 56,
                              dotHeight: 12,
                              dotWidth: 27,
                              spacing: 8,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            OnBoardingModel.onBoardingScreens[index].title,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            OnBoardingModel.onBoardingScreens[index].subTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index != 0
                                  ? CustomTextButton(
                                      text: AppStrings.back,
                                      Onpressed: () {
                                        controller.previousPage(
                                            duration: const Duration(
                                                microseconds: 1000),
                                            curve: Curves.linearToEaseOut);
                                      })
                                  : Container(),
                              index != 2
                                  ? CustomElevatedButton(
                                      text: AppStrings.next,
                                      onPressed: () {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn);
                                      },
                                      height: 48,
                                      width: 90)
                                  : CustomElevatedButton(
                                      text: AppStrings.start,
                                      //navigate to home screen
                                      onPressed: () async {
                                        await sl<CacheHelper>()
                                            .saveData(
                                                key: AppStrings.onBoardingKey,
                                                value: true)
                                            .then((value) {
                                          print('onBoarding visited ');
                                          replace(
                                              context: context,
                                              screen: const HomeScreen());
                                        }).catchError(
                                                (e) => print(e.toString()));
                                      },
                                      height: 48,
                                      width: 151)
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
