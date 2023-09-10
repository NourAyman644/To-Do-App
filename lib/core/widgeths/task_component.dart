import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgeths/custom_elevated_button.dart';

import '../utils/App_colors.dart';
import '../utils/App_strings.dart';

class TaskComponent extends StatelessWidget {
  TaskComponent({required this.TaskColor});
  late Color TaskColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 327,
          height: 128,
          decoration: BoxDecoration(
            color: TaskColor,
            borderRadius: BorderRadiusDirectional.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppStrings.task,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 24,
                          ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: AppColors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '09:33 PM - 09:48 PM',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(
                      'Learn Dart',
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 24,
                              ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 123,
              ),
              const VerticalDivider(
                color: AppColors.white,
                width: 12,
                thickness: 1,
                indent: 30,
                endIndent: 28,
              ),
              // const SizedBox(
              //   width: 9,
              // ),
              RotatedBox(
                quarterTurns: 7,
                child: Text(
                  AppStrings.toDo,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          )),
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: AppColors.sheetColor,
                width: double.infinity,
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                      text: AppStrings.complete,
                      onPressed: () {},
                      height: 48,
                      width: 327,
                    ),
                    CustomElevatedButton(
                      text: AppStrings.delete,
                      onPressed: () {},
                      height: 48,
                      width: 327,
                      color: AppColors.delColor,
                    ),
                    CustomElevatedButton(
                      text: AppStrings.cancal,
                      onPressed: () {},
                      height: 48,
                      width: 327,
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
