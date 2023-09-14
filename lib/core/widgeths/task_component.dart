import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgeths/custom_elevated_button.dart';
import 'package:to_do_app/features/Task/data/models/Task_Model.dart';

import '../utils/App_colors.dart';
import '../utils/App_strings.dart';

class TaskComponent extends StatelessWidget {
  TaskComponent({required this.TaskColor, required this.taskmodel});
  late Color TaskColor;
  final TaskModel taskmodel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    taskmodel.title,
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
                        '${taskmodel.startTime}  - ${taskmodel.endTime}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Text(
                    taskmodel.note,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                taskmodel.isCompleted == 1
                    ? AppStrings.complete
                    : AppStrings.toDo,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ));
  }
}
