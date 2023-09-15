import 'package:flutter/material.dart';

import 'package:to_do_app/features/Task/data/models/Task_Model.dart';

import '../utils/App_colors.dart';
import '../utils/App_strings.dart';

class TaskComponent extends StatelessWidget {
  TaskComponent({required this.TaskColor, required this.taskmodel});
  late Color TaskColor;
  final TaskModel taskmodel;
  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.pink;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.color3;
      case 3:
        return AppColors.color4;
      case 4:
        return AppColors.color5;
      case 5:
        return AppColors.color6;
      default:
        return AppColors.primarycolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //  width: 327,
        height: 128,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: getColor(taskmodel.color),
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskmodel.title,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 24,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    taskmodel.note,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 26,
                        ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   width: 123,
            // ),
            // const VerticalDivider(
            //   color: AppColors.white,
            //   width: 12,
            //   thickness: 1,
            //   indent: 30,
            //   endIndent: 28,
            // ),
            // const SizedBox(
            //   width: 9,
            // ),
            Container(
              height: 75,
              width: 1,
              color: AppColors.white,
              margin: const EdgeInsets.only(right: 10),
            ),
            // SizedBox(width: 10,)
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
