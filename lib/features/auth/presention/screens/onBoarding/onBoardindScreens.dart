import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/common/commonds.dart';

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
                                  : SizedBox(
                                      height: 50.h,
                                    ),
                            ],
                          ),
                          Image.asset(
                              OnBoardingModel.onBoardingScreens[index].img),
                          SizedBox(
                            height: 16.h,
                          ),
                          SmoothPageIndicator(
                            controller: controller,
                            count: OnBoardingModel.onBoardingScreens.length,
                            effect: ExpandingDotsEffect(
                              activeDotColor: AppColors.primarycolor,
                              radius: 56,
                              dotHeight: 12.h,
                              dotWidth: 27.w,
                              spacing: 8,
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            OnBoardingModel.onBoardingScreens[index].title,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(
                            OnBoardingModel.onBoardingScreens[index].subTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 100.h,
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
                                      height: 48.h,
                                      width: 90.w,
                                      color: AppColors.primarycolor,
                                    )
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
                                      height: 48.h,
                                      width: 151.w,
                                      color: AppColors.primarycolor,
                                    )
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
