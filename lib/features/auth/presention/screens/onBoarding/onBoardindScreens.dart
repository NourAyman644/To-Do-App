import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/features/Task/screens/home.dart';
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
                                  ? TextButton(
                                      onPressed: () {
                                        controller.jumpToPage(2);
                                      },
                                      child: Text(
                                        AppStrings.skip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color: AppColors.white
                                                    .withOpacity(0.44)),
                                      ),
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
                                  ? TextButton(
                                      onPressed: () {
                                        controller.previousPage(
                                            duration:
                                                Duration(microseconds: 500),
                                            curve: Curves.linearToEaseOut);
                                      },
                                      child: Text(AppStrings.back,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                color: AppColors.white
                                                    .withOpacity(.44),
                                              )))
                                  : Container(),
                              index != 2
                                  ? SizedBox(
                                      height: 48,
                                      width: 90,
                                      child: ElevatedButton(
                                          style: Theme.of(context)
                                              .elevatedButtonTheme
                                              .style,
                                          onPressed: () {
                                            controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn);
                                          },
                                          child: Text(
                                            AppStrings.next,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          )),
                                    )
                                  : SizedBox(
                                      height: 48,
                                      width: 151,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.btncolor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              )),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen()));
                                          },
                                          child: Text(
                                            AppStrings.start,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          )),
                                    ),
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
